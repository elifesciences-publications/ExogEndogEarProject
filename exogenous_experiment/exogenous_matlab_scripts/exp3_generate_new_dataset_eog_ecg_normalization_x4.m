clear all;close all;clc;
% dependencies:
%   exp3_gen_data_helper_pam.m
%   exp3_gen_data_helper_aam.m
%   exp3_gen_data_helper_tam.m
%   exp3_gen_data_helper_sam.m
%   exp3_gen_data_helper_neck.m
%   exp3_gen_data_helper_ecg.m
%   exp3_gen_data_helper_eog.m
%   exp6_eog_peakstats.mat

%% This scripts generates baseline corrected and normalized rms-envelope
%% signals of the responses

%% This script generates three  .mat files:

%% 1. exp3_4x_normalized_cube_eog_ecg.mat
%% containing all normalized single responses

%% 2. exp3_4x_normalized_eog_ecg.mat
%% containing averaged and normalized responses to every stimulus

%% 3. exp3_results_normalized4x_eog_ecg_ipsiCont.mat
%% containing responses that are further averaged to ipsi- and contralateral
%% responses



%% this script uses preprocessed data from
%% exp3_preprocessed_to_matrix_time.m 
%% Make sure data from individual stmuli are in the same folder, e.g.
%% time_stimulus_1_+30°_helicopter.mat

% load eog data from another experiment for eog voltage to angle
% conversion
load('exp6_eog_peakstats.mat')
eog_maxAngle=35; % maximum angle for eog data from exp6, used as reference for conversion
nSubjects=28;
stimulustypes=[{'traffic jam'},{'birds singing'},{'steps'},{'helicopter'},...
               {'baby crying'},{'dog barking'},{'mosquito'},{'lemur'},...
               {'cell phone'}];
nStimTypes=numel(stimulustypes);

% make sure matrices are large enought for the longest stimulus +
% prestimulus + poststimulus interval
addSamples=2400*3;
bufferlength=addSamples+24003+100; 
buffertemplate=NaN(1,bufferlength+addSamples);

% initialize matrices for responses depending on muscle/direction
% rc = right channel,lc = left channel
% p30 = stimulus from +30°, m30 = stimulus from -30°,
% p120 = stimulus from +120°, m120 = stimulus from -120°

pam_rc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_lc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_rc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_lc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_rc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_lc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_rc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
pam_lc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);

aam_rc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_lc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_rc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_lc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_rc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_lc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_rc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
aam_lc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);

tam_rc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_lc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_rc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_lc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_rc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_lc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_rc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
tam_lc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);

sam_rc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_lc_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_rc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_lc_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_rc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_lc_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_rc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
sam_lc_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);


neck_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
neck_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
neck_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
neck_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);


ecg_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
ecg_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
ecg_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
ecg_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);

eog_p120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
eog_p30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
eog_m120=NaN(nStimTypes,nSubjects,bufferlength+addSamples);
eog_m30=NaN(nStimTypes,nSubjects,bufferlength+addSamples);

%% --- 1 ---
for stimtype= 1:nStimTypes
    
 stimulusName =stimulustypes{stimtype};
 fprintf('Stimulus type: %s (%i/%i)\n',stimulusName,stimtype,nStimTypes)   


fprintf('Subject:')
for subj=1:nSubjects
   
    fprintf('%i,',subj)

    % the following functions perform feature extraction on the
    % corresponding channels, for emg signals:
    % rms-envelopes with a 150 samples window are calculated and 
    % baseline corrected by subtracting the mean value of the prestimulus
    % interval from the response. Then, normalization is performed as
    % follows:
    % for a given channel, muscle and stimulus type, for example right channel,
    % pam and 'traffic jam', the largest value of all four stimulus
    % occurences (once from each direction) is determined and used as a
    % normalization factor.
    % for eog data, only conversion from microVolts to degree is performed
    % based on values from another measurement of the same subject
    
    [pam_rc_p30(stimtype,subj,:),pam_lc_p30(stimtype,subj,:),...
     pam_rc_m30(stimtype,subj,:),pam_lc_m30(stimtype,subj,:),...
     pam_rc_p120(stimtype,subj,:),pam_lc_p120(stimtype,subj,:),...
     pam_rc_m120(stimtype,subj,:),pam_lc_m120(stimtype,subj,:)] = exp3_gen_data_helper_pam(subj,stimulusName,addSamples,buffertemplate);

    [aam_rc_p30(stimtype,subj,:),aam_lc_p30(stimtype,subj,:),...
     aam_rc_m30(stimtype,subj,:),aam_lc_m30(stimtype,subj,:),...
     aam_rc_p120(stimtype,subj,:),aam_lc_p120(stimtype,subj,:),...
     aam_rc_m120(stimtype,subj,:),aam_lc_m120(stimtype,subj,:)] = exp3_gen_data_helper_aam(subj,stimulusName,addSamples,buffertemplate);


     [tam_rc_p30(stimtype,subj,:),tam_lc_p30(stimtype,subj,:),...
     tam_rc_m30(stimtype,subj,:),tam_lc_m30(stimtype,subj,:),...
     tam_rc_p120(stimtype,subj,:),tam_lc_p120(stimtype,subj,:),...
     tam_rc_m120(stimtype,subj,:),tam_lc_m120(stimtype,subj,:)] = exp3_gen_data_helper_tam(subj,stimulusName,addSamples,buffertemplate);

    [sam_rc_p30(stimtype,subj,:),sam_lc_p30(stimtype,subj,:),...
     sam_rc_m30(stimtype,subj,:),sam_lc_m30(stimtype,subj,:),...
     sam_rc_p120(stimtype,subj,:),sam_lc_p120(stimtype,subj,:),...
     sam_rc_m120(stimtype,subj,:),sam_lc_m120(stimtype,subj,:)] = exp3_gen_data_helper_sam(subj,stimulusName,addSamples,buffertemplate);

    [neck_p30(stimtype,subj,:),...
     neck_m30(stimtype,subj,:),...
     neck_p120(stimtype,subj,:),...
     neck_m120(stimtype,subj,:)] = exp3_gen_data_helper_neck(subj,stimulusName,addSamples,buffertemplate);
   

[ecg_p30(stimtype,subj,:),...
     ecg_m30(stimtype,subj,:),...
     ecg_p120(stimtype,subj,:),...
     ecg_m120(stimtype,subj,:)] = exp3_gen_data_helper_ecg(subj,stimulusName,addSamples,buffertemplate);

    [eog_p30(stimtype,subj,:),...
     eog_m30(stimtype,subj,:),...
     eog_p120(stimtype,subj,:),...
     eog_m120(stimtype,subj,:)] = exp3_gen_data_helper_eog(subj,stimulusName,addSamples,buffertemplate,eog_maxAngle,meanpeaks(subj));


end
fprintf('\n')

end

save('exp3_4x_normalized_cube_eog_ecg.mat')

%% --- 2 ---

pam_rc_p30=squeeze(nanmean(pam_rc_p30));
pam_lc_p30=squeeze(nanmean(pam_lc_p30));
pam_rc_m30=squeeze(nanmean(pam_rc_m30));
pam_lc_m30=squeeze(nanmean(pam_lc_m30));
pam_rc_p120=squeeze(nanmean(pam_rc_p120));
pam_lc_p120=squeeze(nanmean(pam_lc_p120));
pam_rc_m120=squeeze(nanmean(pam_rc_m120));
pam_lc_m120=squeeze(nanmean(pam_lc_m120));

aam_rc_p30=squeeze(nanmean(aam_rc_p30));
aam_lc_p30=squeeze(nanmean(aam_lc_p30));
aam_rc_m30=squeeze(nanmean(aam_rc_m30));
aam_lc_m30=squeeze(nanmean(aam_lc_m30));
aam_rc_p120=squeeze(nanmean(aam_rc_p120));
aam_lc_p120=squeeze(nanmean(aam_lc_p120));
aam_rc_m120=squeeze(nanmean(aam_rc_m120));
aam_lc_m120=squeeze(nanmean(aam_lc_m120));

tam_rc_p30=squeeze(nanmean(tam_rc_p30));
tam_lc_p30=squeeze(nanmean(tam_lc_p30));
tam_rc_m30=squeeze(nanmean(tam_rc_m30));
tam_lc_m30=squeeze(nanmean(tam_lc_m30));
tam_rc_p120=squeeze(nanmean(tam_rc_p120));
tam_lc_p120=squeeze(nanmean(tam_lc_p120));
tam_rc_m120=squeeze(nanmean(tam_rc_m120));
tam_lc_m120=squeeze(nanmean(tam_lc_m120));

sam_rc_p30=squeeze(nanmean(sam_rc_p30));
sam_lc_p30=squeeze(nanmean(sam_lc_p30));
sam_rc_m30=squeeze(nanmean(sam_rc_m30));
sam_lc_m30=squeeze(nanmean(sam_lc_m30));
sam_rc_p120=squeeze(nanmean(sam_rc_p120));
sam_lc_p120=squeeze(nanmean(sam_lc_p120));
sam_rc_m120=squeeze(nanmean(sam_rc_m120));
sam_lc_m120=squeeze(nanmean(sam_lc_m120));

save('exp3_4x_normalized_eog_ecg.mat')


%% --- 3 ---

siglen=bufferlength+addSamples;

pam_ipsi_b = zeros(nSubjects,siglen);
pam_ipsi_f = zeros(nSubjects,siglen);
pam_contra_b = zeros(nSubjects,siglen);
pam_contra_f = zeros(nSubjects,siglen);

aam_ipsi_b = zeros(nSubjects,siglen);
aam_ipsi_f = zeros(nSubjects,siglen);
aam_contra_b = zeros(nSubjects,siglen);
aam_contra_f = zeros(nSubjects,siglen);

tam_ipsi_b = zeros(nSubjects,siglen);
tam_ipsi_f = zeros(nSubjects,siglen);
tam_contra_b = zeros(nSubjects,siglen);
tam_contra_f = zeros(nSubjects,siglen);

sam_ipsi_b = zeros(nSubjects,siglen);
sam_ipsi_f = zeros(nSubjects,siglen);
sam_contra_b = zeros(nSubjects,siglen);
sam_contra_f = zeros(nSubjects,siglen);

for k = 1:nSubjects
    
   pam_ipsi_b(k,:) = (pam_rc_p120(k,:)+ pam_lc_m120(k,:))/2;
   pam_ipsi_f(k,:) = (pam_rc_p30(k,:)+ pam_lc_m30(k,:))/2;
   pam_contra_b(k,:) = (pam_lc_p120(k,:)+ pam_rc_m120(k,:))/2;
   pam_contra_f(k,:) = (pam_lc_p30(k,:)+ pam_rc_m30(k,:))/2;
    
   aam_ipsi_b(k,:) = (aam_rc_p120(k,:)+ aam_lc_m120(k,:))/2;
   aam_ipsi_f(k,:) = (aam_rc_p30(k,:)+ aam_lc_m30(k,:))/2;
   aam_contra_b(k,:) = (aam_lc_p120(k,:)+ aam_rc_m120(k,:))/2;
   aam_contra_f(k,:) = (aam_lc_p30(k,:)+ aam_rc_m30(k,:))/2;
    
   tam_ipsi_b(k,:) = (tam_rc_p120(k,:)+ tam_lc_m120(k,:))/2;
   tam_ipsi_f(k,:) = (tam_rc_p30(k,:)+ tam_lc_m30(k,:))/2;
   tam_contra_b(k,:) = (tam_lc_p120(k,:)+ tam_rc_m120(k,:))/2;
   tam_contra_f(k,:) = (tam_lc_p30(k,:)+ tam_rc_m30(k,:))/2;
    
   sam_ipsi_b(k,:) = (sam_rc_p120(k,:)+ sam_lc_m120(k,:))/2;
   sam_ipsi_f(k,:) = (sam_rc_p30(k,:)+ sam_lc_m30(k,:))/2;
   sam_contra_b(k,:) = (sam_lc_p120(k,:)+ sam_rc_m120(k,:))/2;
   sam_contra_f(k,:) = (sam_lc_p30(k,:)+ sam_rc_m30(k,:))/2;
     
    
end

clearvars pam_rc_p30
clearvars pam_lc_p30
clearvars pam_rc_m30
clearvars pam_lc_m30
clearvars pam_rc_p120
clearvars pam_lc_p120
clearvars pam_rc_m120
clearvars pam_lc_m120

clearvars aam_rc_p30
clearvars aam_lc_p30
clearvars aam_rc_m30
clearvars aam_lc_m30
clearvars aam_rc_p120
clearvars aam_lc_p120
clearvars aam_rc_m120
clearvars aam_lc_m120

clearvars tam_rc_p30
clearvars tam_lc_p30
clearvars tam_rc_m30
clearvars tam_lc_m30
clearvars tam_rc_p120
clearvars tam_lc_p120
clearvars tam_rc_m120
clearvars tam_lc_m120

clearvars sam_rc_p30
clearvars sam_lc_p30
clearvars sam_rc_m30
clearvars sam_lc_m30
clearvars sam_rc_p120
clearvars sam_lc_p120
clearvars sam_rc_m120
clearvars sam_lc_m120

clearvars k subj stimtype stimulusName stimulustypes nStimTypes

save('exp3_results_normalized4x_eog_ecg_ipsiCont.mat')