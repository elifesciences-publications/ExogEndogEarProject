clear all;close all;clc
% Dependencies:
%   exp4_buffer_artfilt_average.m 
%   exp4_buffer_artfilt_average_mra.m
%    artfilt_std.m
%   exp4_raw_artilt_normalization.m
%   exp4_averaged_normalized_artfilt_to_ipsiCont_table.m

%% Load preprocessed exp4 data and calculates
%% the mean energy during each measurements after
%% rejecting artifacts based in the signal's distribution (+-nstd)
%% averaged values are then normalized and saved

%% part 1:  time signal
%% part 2:  multiresolution signal
%% part 3: average to ipsi/contralateral responses and generate table used for
%%         statistical inference

%% Nomenclature:
%% .b. -> attend back speakers
%% .f. -> attend back speakers
%% fr -> focus right (attend right speaker)
%% fl -> focus left (attend left speaker)
%% _r_ -> right channel
%% _l_ -> left channel
%% e.g. averaged_raw.b.fr_sam_l_story -> back speakers were used (+-120°), right one was attended, signal belongs
%% to the left SAM

%% - - - PART 1 - - -
tic
listing = dir('*B_filtered_sig.mat');
averaged_raw=struct;
averaged_raw.b=struct;
averaged_raw.f=struct;

nbuffer=2400; % length of segments for artifact rejection (2400 samples = 1 second) 
nstd=2; % number of standard deviations for artifact rejection


for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf(' Done.\n')

averaged_raw.b.fr_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.pam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.pam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.pam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.pam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.sam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.sam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.sam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.sam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.tam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.tam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.tam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.tam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.aam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.aam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.aam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.aam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.b.fr_neck_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.neck_sig.signal_story,nbuffer,nstd) ;
averaged_raw.b.fl_neck_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.neck_sig.signal_story,nbuffer,nstd) ;

end
toc

listing = dir('*F_filtered_sig.mat');
for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf('Done.\n')

averaged_raw.f.fr_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.pam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.pam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.pam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.pam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.sam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.sam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.sam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.sam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.tam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.tam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.tam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.tam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.aam_r_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.aam_r_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.aam_l_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.aam_l_sig.signal_story,nbuffer,nstd) ;

averaged_raw.f.fr_neck_story(loadvar,:) = exp4_buffer_artfilt_average(signals_r.neck_sig.signal_story,nbuffer,nstd) ;
averaged_raw.f.fl_neck_story(loadvar,:) = exp4_buffer_artfilt_average(signals_l.neck_sig.signal_story,nbuffer,nstd) ;

end
toc

clearvars signals_r signals_l loadvar
%save('exp4_averaged_raw_timesignal_artfilt.mat')
exp4_raw_artfilt_normalization; % normalization
fprintf('Saving: exp4_averaged_normalized_timesignal_artfilt.mat\n')
save('exp4_averaged_normalized_timesignal_artfilt.mat')

clear all;close all;

%% - - - PART 2 - - -

tic
listing = dir('*B_filtered_sig.mat');
averaged_raw=struct;
averaged_raw.b=struct;
averaged_raw.f=struct;

nbuffer=2400; % length of segments for artifact rejection (2400 samples = 1 second) 
nstd=2; % number of standard deviations for artifact rejection

for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf(' Done.\n')

averaged_raw.b.fr_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.pam_r_mra.story,nbuffer,nstd);
averaged_raw.b.fl_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.pam_r_mra.story,nbuffer,nstd);

averaged_raw.b.fr_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.pam_l_mra.story,nbuffer,nstd);
averaged_raw.b.fl_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.pam_l_mra.story,nbuffer,nstd);

averaged_raw.b.fr_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.sam_r_mra.story,nbuffer,nstd);
averaged_raw.b.fl_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.sam_r_mra.story,nbuffer,nstd);

averaged_raw.b.fr_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.sam_l_mra.story,nbuffer,nstd);
averaged_raw.b.fl_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.sam_l_mra.story,nbuffer,nstd);

averaged_raw.b.fr_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.tam_r_mra.story,nbuffer,nstd);
averaged_raw.b.fl_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.tam_r_mra.story,nbuffer,nstd);

averaged_raw.b.fr_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.tam_l_mra.story,nbuffer,nstd);
averaged_raw.b.fl_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.tam_l_mra.story,nbuffer,nstd);

averaged_raw.b.fr_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.aam_r_mra.story,nbuffer,nstd);
averaged_raw.b.fl_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.aam_r_mra.story,nbuffer,nstd);

averaged_raw.b.fr_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.aam_l_mra.story,nbuffer,nstd);
averaged_raw.b.fl_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.aam_l_mra.story,nbuffer,nstd);

averaged_raw.b.fr_neck_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.neck_mra.story,nbuffer,nstd);
averaged_raw.b.fl_neck_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.neck_mra.story,nbuffer,nstd);

end
toc

listing = dir('*F_filtered_sig.mat');
for loadvar=1:size(listing,1)
loadstr=(listing(loadvar).name);
fprintf('Loading: %s',loadstr)
load(loadstr);
fprintf(' .Done.\n')

averaged_raw.f.fr_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.pam_r_mra.story,nbuffer,nstd);
averaged_raw.f.fl_pam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.pam_r_mra.story,nbuffer,nstd);

averaged_raw.f.fr_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.pam_l_mra.story,nbuffer,nstd);
averaged_raw.f.fl_pam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.pam_l_mra.story,nbuffer,nstd);

averaged_raw.f.fr_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.sam_r_mra.story,nbuffer,nstd);
averaged_raw.f.fl_sam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.sam_r_mra.story,nbuffer,nstd);

averaged_raw.f.fr_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.sam_l_mra.story,nbuffer,nstd);
averaged_raw.f.fl_sam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.sam_l_mra.story,nbuffer,nstd);

averaged_raw.f.fr_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.tam_r_mra.story,nbuffer,nstd);
averaged_raw.f.fl_tam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.tam_r_mra.story,nbuffer,nstd);

averaged_raw.f.fr_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.tam_l_mra.story,nbuffer,nstd);
averaged_raw.f.fl_tam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.tam_l_mra.story,nbuffer,nstd);

averaged_raw.f.fr_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.aam_r_mra.story,nbuffer,nstd);
averaged_raw.f.fl_aam_r_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.aam_r_mra.story,nbuffer,nstd);

averaged_raw.f.fr_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.aam_l_mra.story,nbuffer,nstd);
averaged_raw.f.fl_aam_l_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.aam_l_mra.story,nbuffer,nstd);

averaged_raw.f.fr_neck_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_r.neck_mra.story,nbuffer,nstd);
averaged_raw.f.fl_neck_story(loadvar,:) = exp4_buffer_artfilt_average_mra(signals_l.neck_mra.story,nbuffer,nstd);

end
toc

clearvars signals_r signals_l loadvar
%save('exp4_averaged_raw_mra_artfilt.mat')
exp4_raw_artilt_normalization; % normalization
fprintf('Saving: exp4_averaged_normalized_mra_artfilt.mat\n')
save('exp4_averaged_normalized_mra_artfilt.mat')


%% - - - PART 3 - - -

%% generate ipsi/contralateral response tables
exp4_averaged_normalized_artfilt_to_ipsiCont_table;

% writetable(T_timesignal,'exp4_results_normalized_artfilt_timesignal')
% writetable(T_mra,'exp4_results_normalized_artfilt_mra')