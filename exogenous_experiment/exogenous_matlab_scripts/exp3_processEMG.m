function [signals_time,signals_modwt,signals_mra] = exp3_processEMG(y,channelConfig)
% called by exp3_Preprocessing.m
% Dependencies:
% triggerDetection2.m

%% This script prepocesses raw data: synchronizing with the video trigger, 
%% filtering and rereferencing

signals_time=struct;
signals_mra=struct;
signals_modwt=struct;
dsfactor=4;  % downsampling factors: 9600 -> 2400

fs=9600;
fn=fs/2;

y=y(:,2500:end); % remove aquisition artefact of the biosignal amplifier

%% Filter Settings
% 50 Hz power line notch
wo = 50/(fn);  bw = wo/35;
[bn,an] = iirnotch(wo,bw);

% auricular EMG filter
a=1; % denominator for fir filter
b=fir1(2000,[10,1000]/(fn));

% SCM/neck EMG filter
b_neck=fir1(2000,[60,1000]/(fn));

% EOG filter
order=2;
[b_eog,a_eog]=butter(order,[.01,20]/(fn));

% ECG filter
[b_ecg,a_ecg]=butter(order,[0.67,40]/(fn));

% Pulse filter
[b_pulse,a_pulse]=butter(order,[1,30]/(fn));



%% Cut the signal to the same length as the corresponding video data
videotrigger=(y(4,:));
offset_millisecons = 20;
offset = offset_millisecons/1000*fs; % number of samples to remove at the end of the trigger
[triggerOnsets, triggerOffsets,trigger] = triggerDetection2(videotrigger, fs,offset);

% exception for subject 07:
% video trigger ends after 23 stimuli, but experiment went on uninterrupted
% therefore we extend the trigger signal
[~,tmp_offsets1,emg_trigger_l]=triggerDetection2(y(2,triggerOnsets:triggerOffsets), fs,offset);
[~,tmp_offsets2,emg_trigger_r]=triggerDetection2(y(3,triggerOnsets:triggerOffsets), fs,offset);
tmp_offsets=sort([tmp_offsets1,tmp_offsets2]);
if numel(tmp_offsets)~=36 
 fprintf('\n- - - Video trigger correction - - -\n')
 [~,tmp_offsets1,emg_trigger_l]=triggerDetection2(y(2,:), fs,offset);
 [~,tmp_offsets2,emg_trigger_r]=triggerDetection2(y(3,:), fs,offset);
 tmp_offsets=sort([tmp_offsets1,tmp_offsets2]);

 triggerOffsets=tmp_offsets(end)+96000;     
end

y=y(:,triggerOnsets:triggerOffsets); % y is not synchronized with the video data

% sanity check, compare with recorded video length
fvtl=sum(trigger);
fprintf('Video trigger length: %i samples\n',fvtl)
fprintf('(%.3f minutes|%i min %.2f sec)\n',fvtl/fs/60,floor(fvtl/fs/60),mod(fvtl/fs,60))
fprintf('New signal length - video \ntrigger length: %i\n',size(y,2)-fvtl)

% downsample and correct time vector for offset -> synchronization with
% recorded video
signals_time.timevec=downsample(y(1,:),dsfactor);
signals_time.timevec=signals_time.timevec-signals_time.timevec(1);

% downsample trigger signals for auditory stimuli and
% check number of auditory stimuli
[~,~,emg_trigger_l]=triggerDetection2(y(2,:), fs,offset); % trigger left stimuli
[~,~,emg_trigger_r]=triggerDetection2(y(3,:), fs,offset); % trigger right stimuli
signals_time.emg_trigger=downsample(emg_trigger_l|emg_trigger_r,dsfactor); % trigger left and right stimuli
signals_time.emg_trigger_r=emg_trigger_r;
signals_time.emg_trigger_l=emg_trigger_l;

pks=findpeaks(1*signals_time.emg_trigger);
fprintf('%i/36 Transients detected\n',numel(pks))

%% Filter data
fprintf('Filtering.')

% EOG
eog_r=y(18,:);
eog_l=y(20,:);
signals_time.eog_bp= downsample(filtfilt(b_eog,a_eog,eog_r-eog_l),dsfactor);

% ECG 
ECG=y(6,:);
ECG_filt=filtfilt(b_ecg,a_ecg,ECG);
signals_time.ECG=downsample(filtfilt(bn,an,ECG_filt),dsfactor);

% Pulse
PULSE=y(8,:);
PULSE_filt=filtfilt(b_pulse,a_pulse,PULSE);
signals_time.PULSE=downsample(filtfilt(bn,an,PULSE_filt),dsfactor);

% Temperature
TEMP=y(9,:);
signals_time.TEMP=downsample(filtfilt(bn,an,TEMP),dsfactor);

% M.SCM, two versions: with and without notch, since highpass freq. > 50 Hz
% Version with notch (f3) however is used later on
signals_time.neck_r_f2=filtfilt(b_neck,1,y(19,:));
signals_time.neck_l_f2=filtfilt(b_neck,1,y(21,:));
signals_time.neck_bp_f2=downsample(signals_time.neck_r_f2-signals_time.neck_l_f2,dsfactor);

signals_time.neck_r_f3=filtfilt(bn,an,filtfilt(b_neck,1,y(19,:)));
signals_time.neck_l_f3=filtfilt(bn,an,filtfilt(b_neck,1,y(21,:)));
signals_time.neck_bp_f3=downsample(signals_time.neck_r_f3-signals_time.neck_l_f3,dsfactor);
signals_time.note='f2 = 60-1000 Hz, no notch | f3 = additionally 50 Hz notch';

% Filtering all signals with the auricular EMG filter for later
% referencing, this will take some time
h = waitbar(0,'Filtering...');
for ls=1:size(y,1)
tmpsig=y(ls,:);
waitbar(ls/size(y,1),h,sprintf('Filtering %i/%i',ls,size(y,1)))
y(ls,:)=filtfilt(bn,an,filtfilt(b,a,tmpsig));
end
fprintf('-')
close(h) 

% downsampling the filtered matrix
newlen=length(downsample(y(1,:),dsfactor));
yds=zeros(size(y,1),newlen);
for k = 1:size(y,1)
   yds(k,:)=downsample(y(k,:),dsfactor);
end
y=yds;


%% refererencing the filtered matrix for auricular muscles
signals_time.pam_r_bp=y(22,:)-y(23,:);
signals_time.pam_l_bp=y(30,:)-y(31,:);
signals_time.sam_r_bp=y(24,:)-y(25,:);
signals_time.sam_l_bp=y(32,:)-y(33,:);
signals_time.aam_r_bp=y(26,:)-y(27,:);
signals_time.aam_l_bp=y(34,:)-y(35,:);
signals_time.tam_r_bp=y(28,:)-y(29,:);
signals_time.tam_l_bp=y(36,:)-y(37,:);

% Optional multiresolution analysis - not used in paper
%  fprintf(' Calculating MRA.')
%  [signals_modwt.pam_r_modwt,signals_mra.pam_r_mra] = exp3_multiresanalysis(signals_time.pam_r_bp);
%  [signals_modwt.pam_l_modwt,signals_mra.pam_l_mra] = exp3_multiresanalysis(signals_time.pam_l_bp);
%  
%  [signals_modwt.aam_r_modwt,signals_mra.aam_r_mra] = exp3_multiresanalysis(signals_time.aam_r_bp);
%  [signals_modwt.aam_l_modwt,signals_mra.aam_l_mra] = exp3_multiresanalysis(signals_time.aam_l_bp);
%  
%  [signals_modwt.tam_r_modwt,signals_mra.tam_r_mra] = exp3_multiresanalysis(signals_time.tam_r_bp);
%  [signals_modwt.tam_l_modwt,signals_mra.tam_l_mra] = exp3_multiresanalysis(signals_time.tam_l_bp);
%  
%  [signals_modwt.sam_r_modwt,signals_mra.sam_r_mra] = exp3_multiresanalysis(signals_time.sam_r_bp);
%  [signals_modwt.sam_l_modwt,signals_mra.sam_l_mra] = exp3_multiresanalysis(signals_time.sam_l_bp);
%  
%  [signals_modwt.neck_modwt,signals_mra.neck_mra] = exp3_multiresanalysis(signals_time.neck_bp_f3);
 fprintf(' Done.\n')

end