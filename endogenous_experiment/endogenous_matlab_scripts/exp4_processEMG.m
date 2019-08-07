function signals = exp4_processEMG(y)
% Dependencies:
%   exp4_getFeaturesEMG.m
%   triggerDetection2.m
%   exp4_cut_story.m


%% This script prepocesses raw data: synchronizing with the video trigger, 
%% filtering, rereferencing, multiresolution analysis (wavelet decomposition)
%% and also returns data during active listening only


signals=struct;

fs=9600;
fn=fs/2;

dsfactor=4; % downsampling factor: 9600 -> 2400

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
y=y(:,triggerOnsets:triggerOffsets);

% downsample and correct time vector for offset -> synchronization with
% recorded video
signals.timevec.timevec=downsample(y(1,:),dsfactor);
signals.timevec=signals.timevec-signals.timevec(1);

% downsample trigger signals for audio stimulation
[~,~,emg_trigger_l]=triggerDetection2(y(2,:), fs,offset);
[~,~,emg_trigger_r]=triggerDetection2(y(3,:), fs,offset);
signals.emg_trigger=downsample(emg_trigger_l|emg_trigger_r,dsfactor); 

%% Filter data

% EOG
eog_r=y(18,:);
eog_l=y(20,:);
signals.eog_bp= downsample(filtfilt(b_eog,a_eog,eog_r-eog_l),dsfactor); 

% ECG
ECG=y(6,:);
ECG_filt=filtfilt(b_ecg,a_ecg,ECG);
signals.ECG=downsample(filtfilt(bn,an,ECG_filt),dsfactor);

% Pulse
PULSE=y(8,:);
PULSE_filt=filtfilt(b_pulse,a_pulse,PULSE);
signals.PULSE=downsample(filtfilt(bn,an,PULSE_filt),dsfactor);

% Temperature
TEMP=y(9,:);
signals.TEMP=downsample(filtfilt(bn,an,TEMP),dsfactor);


% M.SCM
signals.neck_r_f3=filtfilt(bn,an,filtfilt(b_neck,1,y(19,:)));
signals.neck_l_f3=filtfilt(bn,an,filtfilt(b_neck,1,y(21,:)));
signals.neck_bp_f3=downsample(signals.neck_r_f3-signals.neck_l_f3,dsfactor);
signals.note=' 60-1000 Hz instead of 10-1000, 50 Hz notch';


% Filtering all signals with the auricular EMG filter for later
% referencing, this will take some time
parfor ls=1:size(y,1)
tmpsig=y(ls,:);
y(ls,:)=filtfilt(bn,an,filtfilt(b,a,tmpsig)); 
end


% downsampling the filtered matrix
yds=[];
for k = 1:size(y,1)
   yds(k,:)=downsample(y(k,:),dsfactor); 
end
y=yds;


%% refererencing the filtered matrix for auricular muscles

signals.pam_r_bp=y(22,:)-y(23,:);
signals.pam_l_bp=y(30,:)-y(31,:);
signals.sam_r_bp=y(24,:)-y(25,:);
signals.sam_l_bp=y(32,:)-y(33,:);

signals.aam_r_bp=y(26,:)-y(27,:);
signals.aam_l_bp=y(34,:)-y(35,:);
signals.tam_r_bp=y(28,:)-y(29,:);
signals.tam_l_bp=y(36,:)-y(37,:);


%% perform multiresolution analysis (wavelet decomposition)
%% decomposed signal is already cut to contain only the parts during active listening
% right channel
signals.pam_r_mra = exp4_getFeaturesEMG(signals.pam_r_bp,signals.emg_trigger);
signals.aam_r_mra = exp4_getFeaturesEMG(signals.aam_r_bp,signals.emg_trigger);
signals.tam_r_mra = exp4_getFeaturesEMG(signals.tam_r_bp,signals.emg_trigger);
signals.sam_r_mra = exp4_getFeaturesEMG(signals.sam_r_bp,signals.emg_trigger);


% left channel
signals.pam_l_mra = exp4_getFeaturesEMG(signals.pam_l_bp,signals.emg_trigger);
signals.aam_l_mra = exp4_getFeaturesEMG(signals.aam_l_bp,signals.emg_trigger);
signals.tam_l_mra = exp4_getFeaturesEMG(signals.tam_l_bp,signals.emg_trigger);
signals.sam_l_mra = exp4_getFeaturesEMG(signals.sam_l_bp,signals.emg_trigger);


signals.neck_mra = exp4_getFeaturesEMG(signals.neck_bp_f3,signals.emg_trigger); %% 60-1000 Hz 


%% cut time signal to the active listening condition
% right channel
signals.pam_r_sig = exp4_cut_story(signals.pam_r_bp,signals.emg_trigger);
signals.aam_r_sig = exp4_cut_story(signals.aam_r_bp,signals.emg_trigger);
signals.tam_r_sig = exp4_cut_story(signals.tam_r_bp,signals.emg_trigger);
signals.sam_r_sig = exp4_cut_story(signals.sam_r_bp,signals.emg_trigger);

% right channel
signals.pam_l_sig = exp4_cut_story(signals.pam_l_bp,signals.emg_trigger);
signals.aam_l_sig = exp4_cut_story(signals.aam_l_bp,signals.emg_trigger);
signals.tam_l_sig = exp4_cut_story(signals.tam_l_bp,signals.emg_trigger);
signals.sam_l_sig = exp4_cut_story(signals.sam_l_bp,signals.emg_trigger);


signals.neck_sig = exp4_cut_story(signals.neck_bp_f3,signals.emg_trigger);

% monopolar signals
signals.neck_sig_r = exp4_cut_story(signals.neck_r_f3,signals.emg_trigger);
signals.neck_sig_l = exp4_cut_story(signals.neck_l_f3,signals.emg_trigger);

signals.ECG = exp4_cut_story(signals.ECG,signals.emg_trigger);
signals.PULSE = exp4_cut_story(signals.PULSE,signals.emg_trigger);
signals.TEMP = exp4_cut_story(signals.TEMP,signals.emg_trigger);
signals.eog_sig = exp4_cut_story(signals.eog_bp,signals.emg_trigger);
end