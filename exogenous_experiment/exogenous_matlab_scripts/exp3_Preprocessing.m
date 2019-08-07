clear ;close all;clc;
% Dependencies:
% - exp3_processEMG
%  - triggerDetection2.m

%% This is the initial script for the exogenous (exp3) experiment.
%% Preprocessing steps include: synchronizing the data with the recorded
%% video data, filtering, rereferencing (channels were initially recorded
%% against gound only).
%% Multiresolution analysis is commented out.

%% raw data have a size of ~95 GB and preprocessed data ~15 GB


subj=[5:32]; % subject identifiers

tic
for subjectNR=subj

%% cd <path to raw data>

loadstr=sprintf('S%02d_exp3.mat',subjectNR);
savestr_time = sprintf('subject_%02d_exp3_preprocessed_time.mat',subjectNR);
%savestr_mra = sprintf('subject_%02d_exp3_preprocessed_mra.mat',subjectNR);
%savestr_modwt = sprintf('subject_%02d_exp3_preprocessed_modwt.mat',subjectNR);

fprintf('Loading %s.',loadstr)
load(loadstr)
fprintf('Done.\nProcessing.')

[signals_time,~,~]  = exp3_processEMG(y,2);

fprintf('Saving %s as \n%s',loadstr,savestr_time)

% fprintf('Saving %s as \n%s\n%s\n%s',loadstr,savestr_time,savestr_modwt,savestr_mra)

%% cd <path to wherever preprocessed data should be stored>

save(savestr_time,'signals_time');
% Optional multiresolution analysis - not used in paper
%save(savestr_modwt,'signals_modwt');
%save(savestr_mra,'signals_mra');
fprintf('Done.\n')


toc

end
