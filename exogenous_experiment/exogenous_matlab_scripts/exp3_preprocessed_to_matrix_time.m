close all;clear all;clc;

%% needs to find subject_xx_exp3_preprocessed_time.mat files and
%% generates one separate .mat file for every auditory stimulus (sound type and direction)
%% e.g. time_stimulus_1_+30°_helicopter.mat with the responses of all subjects
%% to the first stimulus of the paradigm, which comes from the +30° speaker
%% and is the sound of a helicopter

%% only data during stimulus presentation, 3 seconds before and after are saved
%% generated files are approximatelx 2.25 GB large (combined)

load('exp_3_stimulation_order.mat')

fs=2400;
addSamples=3*fs; % also consider 3 seconds before stimulus onset and 3s after stimulus offset
subjects = 5:32; % subject identifiers

nSubjects=numel(subjects);
nStimuli=size(stim_combined,1);

% deprecated from previous analysis
% varNames=[{'pam_r'},{'pam_l'},{'aam_r'},{'aam_l'},{'tam_r'},{'tam_l'},{'sam_r'},{'sam_l'},{'neck'}];
% vartype=repmat({'double'},[numel(varNames),1]);
% nSubbands=8;
% time_during=table('Size',[nStimuli,numel(varNames)],'VariableTypes',vartype,'VariableNames',varNames);
% time_before=table('Size',[nStimuli,numel(varNames)],'VariableTypes',vartype,'VariableNames',varNames);
% time_after=table('Size',[nStimuli,numel(varNames)],'VariableTypes',vartype,'VariableNames',varNames);


for stimnr=1:nStimuli
       
 for k=1:nSubjects
    loadnum=subjects(k);
    loadstr_time=sprintf('subject_%02d_exp3_preprocessed_time.mat',loadnum);
    
    fprintf('Loading:\n%s',loadstr_time)
    load(loadstr_time)
    fprintf('\nDone. Calculating.\n')
           
    trigger=signals_time.emg_trigger;
    triggerOnsets = find(diff(trigger) == 1) ;
    triggerOffsets = find(diff(trigger) == -1);
    trigger_times=[triggerOnsets;triggerOffsets];
    
    indx_signal=trigger_times(1,stimnr):trigger_times(2,stimnr); % indices of current stimulus 
    indx_pre=(indx_signal(1)-addSamples):indx_signal(1)-1; % indices 3 seconds before stimulus onset
    indx_post=indx_signal(end)+1:(indx_signal(end)+addSamples); % indices 3 seconds afer stimulus offset
    
    tmpsig_pam_r_during = signals_time.pam_r_bp(indx_signal);
    tmpsig_pam_r_before = signals_time.pam_r_bp(indx_pre); 
    tmpsig_pam_r_after  = signals_time.pam_r_bp(indx_post);
    
    tmpsig_pam_l_during = signals_time.pam_l_bp(indx_signal);
    tmpsig_pam_l_before = signals_time.pam_l_bp(indx_pre); 
    tmpsig_pam_l_after  = signals_time.pam_l_bp(indx_post);

    tmpsig_tam_r_during = signals_time.tam_r_bp(indx_signal);
    tmpsig_tam_r_before = signals_time.tam_r_bp(indx_pre); 
    tmpsig_tam_r_after  = signals_time.tam_r_bp(indx_post);
    
    tmpsig_tam_l_during = signals_time.tam_l_bp(indx_signal);
    tmpsig_tam_l_before = signals_time.tam_l_bp(indx_pre); 
    tmpsig_tam_l_after  = signals_time.tam_l_bp(indx_post);


    tmpsig_sam_r_during = signals_time.sam_r_bp(indx_signal);
    tmpsig_sam_r_before = signals_time.sam_r_bp(indx_pre); 
    tmpsig_sam_r_after  = signals_time.sam_r_bp(indx_post);
    
    tmpsig_sam_l_during = signals_time.sam_l_bp(indx_signal);
    tmpsig_sam_l_before = signals_time.sam_l_bp(indx_pre); 
    tmpsig_sam_l_after  = signals_time.sam_l_bp(indx_post);


    tmpsig_aam_r_during = signals_time.aam_r_bp(indx_signal);
    tmpsig_aam_r_before = signals_time.aam_r_bp(indx_pre); 
    tmpsig_aam_r_after  = signals_time.aam_r_bp(indx_post);
    
    tmpsig_aam_l_during = signals_time.aam_l_bp(indx_signal);
    tmpsig_aam_l_before = signals_time.aam_l_bp(indx_pre); 
    tmpsig_aam_l_after  = signals_time.aam_l_bp(indx_post);

    tmpsig_neck_during = signals_time.neck_bp_f3(indx_signal);
    tmpsig_neck_before = signals_time.neck_bp_f3(indx_pre); 
    tmpsig_neck_after  = signals_time.neck_bp_f3(indx_post);
    
    tmpsig_eog_during = signals_time.eog_bp(indx_signal);
    tmpsig_eog_before = signals_time.eog_bp(indx_pre); 
    tmpsig_eog_after  = signals_time.eog_bp(indx_post);

    tmpsig_ecg_during = signals_time.ECG(indx_signal);
    tmpsig_ecg_before = signals_time.ECG(indx_pre); 
    tmpsig_ecg_after  = signals_time.ECG(indx_post);
    
    %% Initializing matrices once in first iteration (subject)
    %% matrices are initialized with +100 samples in case audio trigger is 
    %% inaccurate and has a few samples too many/few
    if loadnum==subjects(1)   
        pam_r_time_during=zeros(nSubjects,length(tmpsig_pam_r_during)+100);
        pam_r_time_before=zeros(nSubjects,addSamples);
        pam_r_time_after=zeros(nSubjects,addSamples);   

        pam_l_time_during=zeros(nSubjects,length(tmpsig_pam_l_during)+100);
        pam_l_time_before=zeros(nSubjects,addSamples);
        pam_l_time_after=zeros(nSubjects,addSamples);
   
        sam_r_time_during=zeros(nSubjects,length(tmpsig_sam_r_during)+100);
        sam_r_time_before=zeros(nSubjects,addSamples);
        sam_r_time_after=zeros(nSubjects,addSamples);   

        sam_l_time_during=zeros(nSubjects,length(tmpsig_sam_l_during)+100);
        sam_l_time_before=zeros(nSubjects,addSamples);
        sam_l_time_after=zeros(nSubjects,addSamples);
        
        tam_r_time_during=zeros(nSubjects,length(tmpsig_tam_r_during)+100);
        tam_r_time_before=zeros(nSubjects,addSamples);
        tam_r_time_after=zeros(nSubjects,addSamples);   

        tam_l_time_during=zeros(nSubjects,length(tmpsig_tam_l_during)+100);
        tam_l_time_before=zeros(nSubjects,addSamples);
        tam_l_time_after=zeros(nSubjects,addSamples);
           
        aam_r_time_during=zeros(nSubjects,length(tmpsig_aam_r_during)+100);
        aam_r_time_before=zeros(nSubjects,addSamples);
        aam_r_time_after=zeros(nSubjects,addSamples);   

        aam_l_time_during=zeros(nSubjects,length(tmpsig_aam_l_during)+100);
        aam_l_time_before=zeros(nSubjects,addSamples);
        aam_l_time_after=zeros(nSubjects,addSamples);
        
        neck_time_during=zeros(nSubjects,length(tmpsig_neck_during)+100);
        neck_time_before=zeros(nSubjects,addSamples);
        neck_time_after=zeros(nSubjects,addSamples);   
        
        eog_time_during=zeros(nSubjects,length(tmpsig_eog_during)+100);
        eog_time_before=zeros(nSubjects,addSamples);
        eog_time_after=zeros(nSubjects,addSamples);   
        
        ecg_time_during=zeros(nSubjects,length(tmpsig_ecg_during)+100);
        ecg_time_before=zeros(nSubjects,addSamples);
        ecg_time_after=zeros(nSubjects,addSamples);   
    end
    
    %% Buffering - make sure responses always have the same length
    tmpsig_pam_r_during=buffer(tmpsig_pam_r_during,size(pam_r_time_during,2));
    tmpsig_pam_l_during=buffer(tmpsig_pam_l_during,size(pam_l_time_during,2));

    tmpsig_aam_r_during=buffer(tmpsig_aam_r_during,size(aam_r_time_during,2));
    tmpsig_aam_l_during=buffer(tmpsig_aam_l_during,size(aam_l_time_during,2));

    tmpsig_tam_r_during=buffer(tmpsig_tam_r_during,size(tam_r_time_during,2));
    tmpsig_tam_l_during=buffer(tmpsig_tam_l_during,size(tam_l_time_during,2));

    tmpsig_sam_r_during=buffer(tmpsig_sam_r_during,size(sam_r_time_during,2));
    tmpsig_sam_l_during=buffer(tmpsig_sam_l_during,size(sam_l_time_during,2));

    tmpsig_neck_during=buffer(tmpsig_neck_during,size(pam_r_time_during,2));
    tmpsig_eog_during=buffer(tmpsig_eog_during,size(pam_r_time_during,2));
    tmpsig_ecg_during=buffer(tmpsig_ecg_during,size(pam_r_time_during,2));
    %% Assining matrices
        pam_r_time_during(k,:)=tmpsig_pam_r_during;
        pam_r_time_before(k,:)=tmpsig_pam_r_before;
        pam_r_time_after(k,:)=tmpsig_pam_r_after;       

        pam_l_time_during(k,:)=tmpsig_pam_l_during;
        pam_l_time_before(k,:)=tmpsig_pam_l_before;
        pam_l_time_after(k,:)=tmpsig_pam_l_after;

        aam_r_time_during(k,:)=tmpsig_aam_r_during;
        aam_r_time_before(k,:)=tmpsig_aam_r_before;
        aam_r_time_after(k,:)=tmpsig_aam_r_after;       

        aam_l_time_during(k,:)=tmpsig_aam_l_during;
        aam_l_time_before(k,:)=tmpsig_aam_l_before;
        aam_l_time_after(k,:)=tmpsig_aam_l_after;

        tam_r_time_during(k,:)=tmpsig_tam_r_during;
        tam_r_time_before(k,:)=tmpsig_tam_r_before;
        tam_r_time_after(k,:)=tmpsig_tam_r_after;       

        tam_l_time_during(k,:)=tmpsig_tam_l_during;
        tam_l_time_before(k,:)=tmpsig_tam_l_before;
        tam_l_time_after(k,:)=tmpsig_tam_l_after;
        
        sam_r_time_during(k,:)=tmpsig_sam_r_during;
        sam_r_time_before(k,:)=tmpsig_sam_r_before;
        sam_r_time_after(k,:)=tmpsig_sam_r_after;       

        sam_l_time_during(k,:)=tmpsig_sam_l_during;
        sam_l_time_before(k,:)=tmpsig_sam_l_before;
        sam_l_time_after(k,:)=tmpsig_sam_l_after;
        
        neck_time_during(k,:)=tmpsig_neck_during;
        neck_time_before(k,:)=tmpsig_neck_before;
        neck_time_after(k,:)=tmpsig_neck_after;
        
        eog_time_during(k,:)=tmpsig_eog_during;
        eog_time_before(k,:)=tmpsig_eog_before;
        eog_time_after(k,:)=tmpsig_eog_after;
        
        ecg_time_during(k,:)=tmpsig_ecg_during;
        ecg_time_before(k,:)=tmpsig_ecg_before;
        ecg_time_after(k,:)=tmpsig_ecg_after;
    %%


    
 end   
        
        stimulusNumber=stimnr;
        stimulusDirection=stim_direction{stimnr};
        stimulusType=stim_type{stimnr};
        savestr=sprintf('time_stimulus_%i_%s_%s',stimulusNumber,stimulusDirection,stimulusType);
        fprintf('Saving as:%s\n',savestr)
        save(savestr,'pam_l_time_during','pam_l_time_before','pam_l_time_after',...
                     'pam_r_time_during','pam_r_time_before','pam_r_time_after',...
                     'aam_l_time_during','aam_l_time_before','aam_l_time_after',...
                     'aam_r_time_during','aam_r_time_before','aam_r_time_after',...
                     'sam_l_time_during','sam_l_time_before','sam_l_time_after',...
                     'sam_r_time_during','sam_r_time_before','sam_r_time_after',...
                     'tam_l_time_during','tam_l_time_before','tam_l_time_after',...
                     'tam_r_time_during','tam_r_time_before','tam_r_time_after',...
                     'neck_time_during','neck_time_before','neck_time_after',...
                     'eog_time_during','eog_time_before','eog_time_after',...
                     'ecg_time_during','ecg_time_before','ecg_time_after',...
                     'stimulusDirection','stimulusType')  

   
end


