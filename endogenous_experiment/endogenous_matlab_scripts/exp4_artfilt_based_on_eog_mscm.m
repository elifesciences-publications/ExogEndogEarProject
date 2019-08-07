clear all;close all;clc
% Dependencies 
%   exp4_buffer_artfilt_valid_segments
%   exp4_buffer_artfilt_valid_segments_MRA
%   exp4_buffer_artfilt_eog_valid_segments
%   exp4_averaged_raw_valid_to_nan_artfilt_signal_and_mra
%   exp4_valid_nan_segments_normalization
%   exp4_normalized_valid_nan_segments_to_ipsiCont_table

%% Uses preprocessed data from exp4.
%% Segments both time and wavelet decomposed (mra) data into non-overlapping
%% segments of nbuffer length and calculates their mean energy or
%% mean absolute angle (for muscles or eog respectively).
%% The script then flags those segments that exceed
%% +-nstd standard deviations for muscle signals, or
%% +-maxangle for the eog signal.

%% segments that are flagged by either the auricular channel itself, 
%% the M.SCM channel or the EOG are treated as artifacts

%% flagged segments are set to NaN, responses get normalized (discarding NaN entries)
%% averaged to ipsi/contralateral responses and written to a tablt (T_complete)
%% that can be used for statistical inference


%% EOG voltage to angle conversion factors
load('exp6_eog_peakstats.mat')
eog_maxAngle=35; % reference angle
maxangle=15; % mean eog angle threshold for flagging as artifact

tic
listing = dir('*B_filtered_sig.mat');
averaged_raw=struct;
averaged_raw.b=struct;
averaged_raw.f=struct;

fs=2400;
nbuffer=2400; % segment length for artifact rejection
nstd=2; % number of standard deviations for artifact rejection
nSubjects=size(listing,1);

%% B
for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf(' Done.\n')
subjID = str2double(strrep(strrep(loadstr,'subject_EMG',''),'B_filtered_sig.mat',''));
eogIndx=find(subj==subjID);


%% - - - Time Signal - - -
%% AAM
[aam_fl_l,valid_aam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.aam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_aam_l_story(loadvar,:)=aam_fl_l;
averaged_raw.b.valid_fl_aam_l_story(loadvar,:)=valid_aam_fl_l;

[aam_fl_r,valid_aam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.aam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_aam_r_story(loadvar,:)=aam_fl_r;
averaged_raw.b.valid_fl_aam_r_story(loadvar,:)=valid_aam_fl_r;

[aam_fr_l,valid_aam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.aam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_aam_l_story(loadvar,:)=aam_fr_l;
averaged_raw.b.valid_fr_aam_l_story(loadvar,:)=valid_aam_fr_l;

[aam_fr_r,valid_aam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.aam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_aam_r_story(loadvar,:)=aam_fr_r;
averaged_raw.b.valid_fr_aam_r_story(loadvar,:)=valid_aam_fr_r;

%% PAM
[pam_fl_l,valid_pam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.pam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_pam_l_story(loadvar,:)=pam_fl_l;
averaged_raw.b.valid_fl_pam_l_story(loadvar,:)=valid_pam_fl_l;

[pam_fl_r,valid_pam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.pam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_pam_r_story(loadvar,:)=pam_fl_r;
averaged_raw.b.valid_fl_pam_r_story(loadvar,:)=valid_pam_fl_r;

[pam_fr_l,valid_pam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.pam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_pam_l_story(loadvar,:)=pam_fr_l;
averaged_raw.b.valid_fr_pam_l_story(loadvar,:)=valid_pam_fr_l;

[pam_fr_r,valid_pam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.pam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_pam_r_story(loadvar,:)=pam_fr_r;
averaged_raw.b.valid_fr_pam_r_story(loadvar,:)=valid_pam_fr_r;

%% TAM
[tam_fl_l,valid_tam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.tam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_tam_l_story(loadvar,:)=tam_fl_l;
averaged_raw.b.valid_fl_tam_l_story(loadvar,:)=valid_tam_fl_l;

[tam_fl_r,valid_tam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.tam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_tam_r_story(loadvar,:)=tam_fl_r;
averaged_raw.b.valid_fl_tam_r_story(loadvar,:)=valid_tam_fl_r;

[tam_fr_l,valid_tam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.tam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_tam_l_story(loadvar,:)=tam_fr_l;
averaged_raw.b.valid_fr_tam_l_story(loadvar,:)=valid_tam_fr_l;

[tam_fr_r,valid_tam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.tam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_tam_r_story(loadvar,:)=tam_fr_r;
averaged_raw.b.valid_fr_tam_r_story(loadvar,:)=valid_tam_fr_r;

%% SAM
[sam_fl_l,valid_sam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.sam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_sam_l_story(loadvar,:)=sam_fl_l;
averaged_raw.b.valid_fl_sam_l_story(loadvar,:)=valid_sam_fl_l;

[sam_fl_r,valid_sam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.sam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_sam_r_story(loadvar,:)=sam_fl_r;
averaged_raw.b.valid_fl_sam_r_story(loadvar,:)=valid_sam_fl_r;

[sam_fr_l,valid_sam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.sam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_sam_l_story(loadvar,:)=sam_fr_l;
averaged_raw.b.valid_fr_sam_l_story(loadvar,:)=valid_sam_fr_l;

[sam_fr_r,valid_sam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.sam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_sam_r_story(loadvar,:)=sam_fr_r;
averaged_raw.b.valid_fr_sam_r_story(loadvar,:)=valid_sam_fr_r;

%% Neck
[neck_fr,valid_neck_fr]=exp4_buffer_artfilt_valid_segments(signals_r.neck_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fr_neck_story(loadvar,:)=neck_fr;
averaged_raw.b.valid_fr_neck_story(loadvar,:)=valid_neck_fr;

[neck_fl,valid_neck_fl]=exp4_buffer_artfilt_valid_segments(signals_l.neck_sig.signal_story,nbuffer,nstd);
averaged_raw.b.fl_neck_story(loadvar,:)=neck_fl;
averaged_raw.b.valid_fl_neck_story(loadvar,:)=valid_neck_fl;

%% EOG
eog_maxVal=meanpeaks(eogIndx);

[eog_fr,valid_eog_fr]= exp4_buffer_artfilt_eog_valid_segments((signals_r.eog_sig.signal_story./eog_maxVal)*eog_maxAngle,nbuffer,maxangle);
averaged_raw.b.fr_eog_story(loadvar,:)=eog_fr;
averaged_raw.b.valid_fr_eog_story(loadvar,:)=valid_eog_fr;

[eog_fl,valid_eog_fl]= exp4_buffer_artfilt_eog_valid_segments((signals_l.eog_sig.signal_story./eog_maxVal)*eog_maxAngle,nbuffer,maxangle);
averaged_raw.b.fl_eog_story(loadvar,:)=eog_fl;
averaged_raw.b.valid_fl_eog_story(loadvar,:)=valid_eog_fl;


%% - - - MRA - - -

%% AAM
[aam_fl_l,valid_aam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.aam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.b.fl_aam_l_story_mra(loadvar,:,:)=aam_fl_l;
averaged_raw.b.valid_fl_aam_l_story_mra(loadvar,:,:)=valid_aam_fl_l;

[aam_fl_r,valid_aam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.aam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.b.fl_aam_r_story_mra(loadvar,:,:)=aam_fl_r;
averaged_raw.b.valid_fl_aam_r_story_mra(loadvar,:,:)=valid_aam_fl_r;

[aam_fr_l,valid_aam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.aam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.b.fr_aam_l_story_mra(loadvar,:,:)=aam_fr_l;
averaged_raw.b.valid_fr_aam_l_story_mra(loadvar,:,:)=valid_aam_fr_l;

[aam_fr_r,valid_aam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.aam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.b.fr_aam_r_story_mra(loadvar,:,:)=aam_fr_r;
averaged_raw.b.valid_fr_aam_r_story_mra(loadvar,:,:)=valid_aam_fr_r;

%% PAM
[pam_fl_l,valid_pam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.pam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.b.fl_pam_l_story_mra(loadvar,:,:)=pam_fl_l;
averaged_raw.b.valid_fl_pam_l_story_mra(loadvar,:,:)=valid_pam_fl_l;

[pam_fl_r,valid_pam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.pam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.b.fl_pam_r_story_mra(loadvar,:,:)=pam_fl_r;
averaged_raw.b.valid_fl_pam_r_story_mra(loadvar,:,:)=valid_pam_fl_r;

[pam_fr_l,valid_pam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.pam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.b.fr_pam_l_story_mra(loadvar,:,:)=pam_fr_l;
averaged_raw.b.valid_fr_pam_l_story_mra(loadvar,:,:)=valid_pam_fr_l;

[pam_fr_r,valid_pam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.pam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.b.fr_pam_r_story_mra(loadvar,:,:)=pam_fr_r;
averaged_raw.b.valid_fr_pam_r_story_mra(loadvar,:,:)=valid_pam_fr_r;

%% TAM
[tam_fl_l,valid_tam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.tam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.b.fl_tam_l_story_mra(loadvar,:,:)=tam_fl_l;
averaged_raw.b.valid_fl_tam_l_story_mra(loadvar,:,:)=valid_tam_fl_l;

[tam_fl_r,valid_tam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.tam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.b.fl_tam_r_story_mra(loadvar,:,:)=tam_fl_r;
averaged_raw.b.valid_fl_tam_r_story_mra(loadvar,:,:)=valid_tam_fl_r;

[tam_fr_l,valid_tam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.tam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.b.fr_tam_l_story_mra(loadvar,:,:)=tam_fr_l;
averaged_raw.b.valid_fr_tam_l_story_mra(loadvar,:,:)=valid_tam_fr_l;

[tam_fr_r,valid_tam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.tam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.b.fr_tam_r_story_mra(loadvar,:,:)=tam_fr_r;
averaged_raw.b.valid_fr_tam_r_story_mra(loadvar,:,:)=valid_tam_fr_r;

%% SAM
[sam_fl_l,valid_sam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.sam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.b.fl_sam_l_story_mra(loadvar,:,:)=sam_fl_l;
averaged_raw.b.valid_fl_sam_l_story_mra(loadvar,:,:)=valid_sam_fl_l;

[sam_fl_r,valid_sam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.sam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.b.fl_sam_r_story_mra(loadvar,:,:)=sam_fl_r;
averaged_raw.b.valid_fl_sam_r_story_mra(loadvar,:,:)=valid_sam_fl_r;

[sam_fr_l,valid_sam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.sam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.b.fr_sam_l_story_mra(loadvar,:,:)=sam_fr_l;
averaged_raw.b.valid_fr_sam_l_story_mra(loadvar,:,:)=valid_sam_fr_l;

[sam_fr_r,valid_sam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.sam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.b.fr_sam_r_story_mra(loadvar,:,:)=sam_fr_r;
averaged_raw.b.valid_fr_sam_r_story_mra(loadvar,:,:)=valid_sam_fr_r;


end
toc


%% F
listing = dir('*F_filtered_sig.mat');
for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf(' Done.\n')
subjID = str2double(strrep(strrep(loadstr,'subject_EMG',''),'F_filtered_sig.mat',''));
eogIndx=find(subj==subjID);

%% - - - Time Signal - - -

%% AAM
[aam_fl_l,valid_aam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.aam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_aam_l_story(loadvar,:)=aam_fl_l;
averaged_raw.f.valid_fl_aam_l_story(loadvar,:)=valid_aam_fl_l;

[aam_fl_r,valid_aam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.aam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_aam_r_story(loadvar,:)=aam_fl_r;
averaged_raw.f.valid_fl_aam_r_story(loadvar,:)=valid_aam_fl_r;

[aam_fr_l,valid_aam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.aam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_aam_l_story(loadvar,:)=aam_fr_l;
averaged_raw.f.valid_fr_aam_l_story(loadvar,:)=valid_aam_fr_l;

[aam_fr_r,valid_aam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.aam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_aam_r_story(loadvar,:)=aam_fr_r;
averaged_raw.f.valid_fr_aam_r_story(loadvar,:)=valid_aam_fr_r;

%% PAM
[pam_fl_l,valid_pam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.pam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_pam_l_story(loadvar,:)=pam_fl_l;
averaged_raw.f.valid_fl_pam_l_story(loadvar,:)=valid_pam_fl_l;

[pam_fl_r,valid_pam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.pam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_pam_r_story(loadvar,:)=pam_fl_r;
averaged_raw.f.valid_fl_pam_r_story(loadvar,:)=valid_pam_fl_r;

[pam_fr_l,valid_pam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.pam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_pam_l_story(loadvar,:)=pam_fr_l;
averaged_raw.f.valid_fr_pam_l_story(loadvar,:)=valid_pam_fr_l;

[pam_fr_r,valid_pam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.pam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_pam_r_story(loadvar,:)=pam_fr_r;
averaged_raw.f.valid_fr_pam_r_story(loadvar,:)=valid_pam_fr_r;

%% TAM
[tam_fl_l,valid_tam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.tam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_tam_l_story(loadvar,:)=tam_fl_l;
averaged_raw.f.valid_fl_tam_l_story(loadvar,:)=valid_tam_fl_l;

[tam_fl_r,valid_tam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.tam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_tam_r_story(loadvar,:)=tam_fl_r;
averaged_raw.f.valid_fl_tam_r_story(loadvar,:)=valid_tam_fl_r;

[tam_fr_l,valid_tam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.tam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_tam_l_story(loadvar,:)=tam_fr_l;
averaged_raw.f.valid_fr_tam_l_story(loadvar,:)=valid_tam_fr_l;

[tam_fr_r,valid_tam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.tam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_tam_r_story(loadvar,:)=tam_fr_r;
averaged_raw.f.valid_fr_tam_r_story(loadvar,:)=valid_tam_fr_r;

%% SAM
[sam_fl_l,valid_sam_fl_l]=exp4_buffer_artfilt_valid_segments(signals_l.sam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_sam_l_story(loadvar,:)=sam_fl_l;
averaged_raw.f.valid_fl_sam_l_story(loadvar,:)=valid_sam_fl_l;

[sam_fl_r,valid_sam_fl_r]=exp4_buffer_artfilt_valid_segments(signals_l.sam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_sam_r_story(loadvar,:)=sam_fl_r;
averaged_raw.f.valid_fl_sam_r_story(loadvar,:)=valid_sam_fl_r;

[sam_fr_l,valid_sam_fr_l]=exp4_buffer_artfilt_valid_segments(signals_r.sam_l_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_sam_l_story(loadvar,:)=sam_fr_l;
averaged_raw.f.valid_fr_sam_l_story(loadvar,:)=valid_sam_fr_l;

[sam_fr_r,valid_sam_fr_r]=exp4_buffer_artfilt_valid_segments(signals_r.sam_r_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_sam_r_story(loadvar,:)=sam_fr_r;
averaged_raw.f.valid_fr_sam_r_story(loadvar,:)=valid_sam_fr_r;

%% Neck
[neck_fr,valid_neck_fr]=exp4_buffer_artfilt_valid_segments(signals_r.neck_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fr_neck_story(loadvar,:)=neck_fr;
averaged_raw.f.valid_fr_neck_story(loadvar,:)=valid_neck_fr;

[neck_fl,valid_neck_fl]=exp4_buffer_artfilt_valid_segments(signals_l.neck_sig.signal_story,nbuffer,nstd);
averaged_raw.f.fl_neck_story(loadvar,:)=neck_fl;
averaged_raw.f.valid_fl_neck_story(loadvar,:)=valid_neck_fl;

%% EOG
eog_maxVal=meanpeaks(eogIndx);

[eog_fr,valid_eog_fr]= exp4_buffer_artfilt_eog_valid_segments((signals_r.eog_sig.signal_story./eog_maxVal)*eog_maxAngle,nbuffer,maxangle);
averaged_raw.f.fr_eog_story(loadvar,:)=eog_fr;
averaged_raw.f.valid_fr_eog_story(loadvar,:)=valid_eog_fr;

[eog_fl,valid_eog_fl]= exp4_buffer_artfilt_eog_valid_segments((signals_l.eog_sig.signal_story./eog_maxVal)*eog_maxAngle,nbuffer,maxangle);
averaged_raw.f.fl_eog_story(loadvar,:)=eog_fl;
averaged_raw.f.valid_fl_eog_story(loadvar,:)=valid_eog_fl;


%% - - - MRA - - -

%% AAM
[aam_fl_l,valid_aam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.aam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.f.fl_aam_l_story_mra(loadvar,:,:)=aam_fl_l;
averaged_raw.f.valid_fl_aam_l_story_mra(loadvar,:,:)=valid_aam_fl_l;

[aam_fl_r,valid_aam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.aam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.f.fl_aam_r_story_mra(loadvar,:,:)=aam_fl_r;
averaged_raw.f.valid_fl_aam_r_story_mra(loadvar,:,:)=valid_aam_fl_r;

[aam_fr_l,valid_aam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.aam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.f.fr_aam_l_story_mra(loadvar,:,:)=aam_fr_l;
averaged_raw.f.valid_fr_aam_l_story_mra(loadvar,:,:)=valid_aam_fr_l;

[aam_fr_r,valid_aam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.aam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.f.fr_aam_r_story_mra(loadvar,:,:)=aam_fr_r;
averaged_raw.f.valid_fr_aam_r_story_mra(loadvar,:,:)=valid_aam_fr_r;

%% PAM
[pam_fl_l,valid_pam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.pam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.f.fl_pam_l_story_mra(loadvar,:,:)=pam_fl_l;
averaged_raw.f.valid_fl_pam_l_story_mra(loadvar,:,:)=valid_pam_fl_l;

[pam_fl_r,valid_pam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.pam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.f.fl_pam_r_story_mra(loadvar,:,:)=pam_fl_r;
averaged_raw.f.valid_fl_pam_r_story_mra(loadvar,:,:)=valid_pam_fl_r;

[pam_fr_l,valid_pam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.pam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.f.fr_pam_l_story_mra(loadvar,:,:)=pam_fr_l;
averaged_raw.f.valid_fr_pam_l_story_mra(loadvar,:,:)=valid_pam_fr_l;

[pam_fr_r,valid_pam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.pam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.f.fr_pam_r_story_mra(loadvar,:,:)=pam_fr_r;
averaged_raw.f.valid_fr_pam_r_story_mra(loadvar,:,:)=valid_pam_fr_r;

%% TAM
[tam_fl_l,valid_tam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.tam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.f.fl_tam_l_story_mra(loadvar,:,:)=tam_fl_l;
averaged_raw.f.valid_fl_tam_l_story_mra(loadvar,:,:)=valid_tam_fl_l;

[tam_fl_r,valid_tam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.tam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.f.fl_tam_r_story_mra(loadvar,:,:)=tam_fl_r;
averaged_raw.f.valid_fl_tam_r_story_mra(loadvar,:,:)=valid_tam_fl_r;

[tam_fr_l,valid_tam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.tam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.f.fr_tam_l_story_mra(loadvar,:,:)=tam_fr_l;
averaged_raw.f.valid_fr_tam_l_story_mra(loadvar,:,:)=valid_tam_fr_l;

[tam_fr_r,valid_tam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.tam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.f.fr_tam_r_story_mra(loadvar,:,:)=tam_fr_r;
averaged_raw.f.valid_fr_tam_r_story_mra(loadvar,:,:)=valid_tam_fr_r;

%% SAM
[sam_fl_l,valid_sam_fl_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.sam_l_mra.story,nbuffer,nstd);  % focus left, left channel
averaged_raw.f.fl_sam_l_story_mra(loadvar,:,:)=sam_fl_l;
averaged_raw.f.valid_fl_sam_l_story_mra(loadvar,:,:)=valid_sam_fl_l;

[sam_fl_r,valid_sam_fl_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_l.sam_r_mra.story,nbuffer,nstd); % focus left, right channel
averaged_raw.f.fl_sam_r_story_mra(loadvar,:,:)=sam_fl_r;
averaged_raw.f.valid_fl_sam_r_story_mra(loadvar,:,:)=valid_sam_fl_r;

[sam_fr_l,valid_sam_fr_l]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.sam_l_mra.story,nbuffer,nstd); % focus right, left channel
averaged_raw.f.fr_sam_l_story_mra(loadvar,:,:)=sam_fr_l;
averaged_raw.f.valid_fr_sam_l_story_mra(loadvar,:,:)=valid_sam_fr_l;

[sam_fr_r,valid_sam_fr_r]=exp4_buffer_artfilt_valid_segments_MRA(signals_r.sam_r_mra.story,nbuffer,nstd); % focus right, right channel
averaged_raw.f.fr_sam_r_story_mra(loadvar,:,:)=sam_fr_r;
averaged_raw.f.valid_fr_sam_r_story_mra(loadvar,:,:)=valid_sam_fr_r;


end
toc
% clear unnecessary variables
clearvars signals_r signals_l

clearvars pam_fl_l pam_fl_r pam_fr_l pam_fr_r valid_pam_fl_l valid_pam_fl_r valid_pam_fr_l valid_pam_fr_r

clearvars aam_fl_l aam_fl_r aam_fr_l aam_fr_r valid_aam_fl_l valid_aam_fl_r valid_aam_fr_l valid_aam_fr_r

clearvars sam_fl_l sam_fl_r sam_fr_l sam_fr_r valid_sam_fl_l valid_sam_fl_r valid_sam_fr_l valid_sam_fr_r

clearvars tam_fl_l tam_fl_r tam_fr_l tam_fr_r valid_tam_fl_l valid_tam_fl_r valid_tam_fr_l valid_tam_fr_r

clearvars eog_fl eog_fr  valid_eog_fl valid_eog_fr

clearvars neck_fl  neck_fr valid_neck_fl  valid_neck_fr

%% setting flagged segments to NaN
exp4_averaged_raw_valid_to_nan_artfilt_signal_and_mra;
% save processed
save('exp4_averaged_raw_valid_segmented_eog_artfiltered_signal_mra.mat')
%% normalization and plotting of rejection ratios
exp4_valid_nan_segments_normalization;
save('exp4_averaged_normalized_valid_segmented_eog_artfiltered_signal_mra.mat')
%% average to ipsi/contralateral responses and generate table
exp4_normalized_valid_nan_segments_to_ipsiCont_table
%writetable(T_complete,'exp4_results_eog_validseg_time_and_mra')