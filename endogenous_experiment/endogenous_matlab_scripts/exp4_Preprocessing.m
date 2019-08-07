clear ;close all;clc;
% Dependencies:
%   exp4_processEMG
%   exp4_getFeaturesEMG.m
%   exp4_cut_story.m
%   triggerDetection2.m


%% This is the initial script for the endogenous (exp4) experiment.
%% Preprocessing steps include: synchronizing the data with the recorded
%% video data, filtering, rereferencing, multiresolution analysis.

%% raw data nomenclature:
%%    Sxx_exp4bl.mat -> subject xx attending the back (b) left (l) speaker
%%	  Sxx_exp4br.mat -> subject xx attending the back (b) right (r) speaker
%%	  Sxx_exp4fl.mat -> subject xx attending the front (f) left (l) speaker
%%	  Sxx_exp4fr.mat -> subject xx attending the front (f) right (r) speaker

%% preprocessed data:
%% subject_EMGxxB_filtered_sig.mat -> subject xx, preprocessed data attending the back (B) speakers
%% subject_EMGxxF_filtered_sig.mat -> subject xx, preprocessed data attending the front (F) speakers

%% raw data: ~148 GB
%% preprocessed data: ~ 51 GB

subj=[9:32]; % subject identifier


tic
%% Process and save measurements attending back speakers
for subjectNR=subj

%   cd <location of raw data>

loadstr_r=sprintf('S%02d_exp4br.mat',subjectNR);
loadstr_l=sprintf('S%02d_exp4bl.mat',subjectNR);
savestr = sprintf('subject_EMG%02dB_filtered_sig.mat',subjectNR);

%% Focus right
fprintf('Loading %s.',loadstr_r)
load(loadstr_r)
fprintf('Done.\nProcessing.')

signals_r = exp4_processEMG(y);
fprintf('Done.\n')
%% Focus left
fprintf('Loading %s.',loadstr_l)
load(loadstr_l)
fprintf('Done.\nProcessing.')

signals_l = exp4_processEMG(y);
fprintf('Done.\n')


fprintf('Saving %s and\n%s as \n%s',loadstr_r,loadstr_l,savestr)

%   cd <location where preprocessed data should be stored>

save(savestr,'signals_r','signals_l');
fprintf('Done.\n')



end
toc

tic
%% Process and save measurements attending front speakers
for subjectNR=subj

%   cd <location of raw data>

loadstr_r=sprintf('S%02d_exp4fr.mat',subjectNR);
loadstr_l=sprintf('S%02d_exp4fl.mat',subjectNR);
savestr = sprintf('subject_EMG%02dF_filtered_sig.mat',subjectNR);

%% Focus right
fprintf('Loading %s.',loadstr_r)
load(loadstr_r)
fprintf('Done.\nProcessing.')

signals_r = exp4_processEMG(y);
fprintf('Done.\n')

%% Focus left
fprintf('Loading %s.',loadstr_l)
load(loadstr_l)
fprintf('Done.\nProcessing.')

signals_l = exp4_processEMG(y);
fprintf('Done.\n')


fprintf('Saving %s and\n%s as \n%s',loadstr_r,loadstr_l,savestr)

%   cd <location where preprocessed data should be stored>

save(savestr,'signals_r','signals_l');
fprintf('Done.\n')


end
toc

