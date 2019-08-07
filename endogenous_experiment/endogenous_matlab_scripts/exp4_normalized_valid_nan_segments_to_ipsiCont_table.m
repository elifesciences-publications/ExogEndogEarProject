
%% Time Signals
%% b
ipsi_pam_b=  mean([nanmean(averaged_normalized.b.fr_pam_r_story,2),nanmean(averaged_normalized.b.fl_pam_l_story,2)],2);
contra_pam_b=mean([nanmean(averaged_normalized.b.fr_pam_l_story,2),nanmean(averaged_normalized.b.fl_pam_r_story,2)],2);

ipsi_aam_b=  mean([nanmean(averaged_normalized.b.fr_aam_r_story,2),nanmean(averaged_normalized.b.fl_aam_l_story,2)],2);
contra_aam_b=mean([nanmean(averaged_normalized.b.fr_aam_l_story,2),nanmean(averaged_normalized.b.fl_aam_r_story,2)],2);

ipsi_tam_b=  mean([nanmean(averaged_normalized.b.fr_tam_r_story,2),nanmean(averaged_normalized.b.fl_tam_l_story,2)],2);
contra_tam_b=mean([nanmean(averaged_normalized.b.fr_tam_l_story,2),nanmean(averaged_normalized.b.fl_tam_r_story,2)],2);

ipsi_sam_b=  mean([nanmean(averaged_normalized.b.fr_sam_r_story,2),nanmean(averaged_normalized.b.fl_sam_l_story,2)],2);
contra_sam_b=mean([nanmean(averaged_normalized.b.fr_sam_l_story,2),nanmean(averaged_normalized.b.fl_sam_r_story,2)],2);
%% f
ipsi_pam_f=  mean([nanmean(averaged_normalized.f.fr_pam_r_story,2),nanmean(averaged_normalized.f.fl_pam_l_story,2)],2);
contra_pam_f=mean([nanmean(averaged_normalized.f.fr_pam_l_story,2),nanmean(averaged_normalized.f.fl_pam_r_story,2)],2);

ipsi_aam_f=  mean([nanmean(averaged_normalized.f.fr_aam_r_story,2),nanmean(averaged_normalized.f.fl_aam_l_story,2)],2);
contra_aam_f=mean([nanmean(averaged_normalized.f.fr_aam_l_story,2),nanmean(averaged_normalized.f.fl_aam_r_story,2)],2);

ipsi_tam_f=  mean([nanmean(averaged_normalized.f.fr_tam_r_story,2),nanmean(averaged_normalized.f.fl_tam_l_story,2)],2);
contra_tam_f=mean([nanmean(averaged_normalized.f.fr_tam_l_story,2),nanmean(averaged_normalized.f.fl_tam_r_story,2)],2);

ipsi_sam_f=  mean([nanmean(averaged_normalized.f.fr_sam_r_story,2),nanmean(averaged_normalized.f.fl_sam_l_story,2)],2);
contra_sam_f=mean([nanmean(averaged_normalized.f.fr_sam_l_story,2),nanmean(averaged_normalized.f.fl_sam_r_story,2)],2);

%% MRA
%% pam b
ipsi_pam_b_mra=(nanmean(averaged_normalized.b.fr_pam_r_story_mra,3)+nanmean(averaged_normalized.b.fl_pam_l_story_mra,3))/2;
contra_pam_b_mra=(nanmean(averaged_normalized.b.fr_pam_l_story_mra,3)+nanmean(averaged_normalized.b.fl_pam_r_story_mra,3))/2;
%% pam f
ipsi_pam_f_mra=(nanmean(averaged_normalized.f.fr_pam_r_story_mra,3)+nanmean(averaged_normalized.f.fl_pam_l_story_mra,3))/2;
contra_pam_f_mra=(nanmean(averaged_normalized.f.fr_pam_l_story_mra,3)+nanmean(averaged_normalized.f.fl_pam_r_story_mra,3))/2;

%% aam b
ipsi_aam_b_mra=(nanmean(averaged_normalized.b.fr_aam_r_story_mra,3)+nanmean(averaged_normalized.b.fl_aam_l_story_mra,3))/2;
contra_aam_b_mra=(nanmean(averaged_normalized.b.fr_aam_l_story_mra,3)+nanmean(averaged_normalized.b.fl_aam_r_story_mra,3))/2;
%% aam f
ipsi_aam_f_mra=(nanmean(averaged_normalized.f.fr_aam_r_story_mra,3)+nanmean(averaged_normalized.f.fl_aam_l_story_mra,3))/2;
contra_aam_f_mra=(nanmean(averaged_normalized.f.fr_aam_l_story_mra,3)+nanmean(averaged_normalized.f.fl_aam_r_story_mra,3))/2;

%% tam b
ipsi_tam_b_mra=(nanmean(averaged_normalized.b.fr_tam_r_story_mra,3)+nanmean(averaged_normalized.b.fl_tam_l_story_mra,3))/2;
contra_tam_b_mra=(nanmean(averaged_normalized.b.fr_tam_l_story_mra,3)+nanmean(averaged_normalized.b.fl_tam_r_story_mra,3))/2;
%% tam f
ipsi_tam_f_mra=(nanmean(averaged_normalized.f.fr_tam_r_story_mra,3)+nanmean(averaged_normalized.f.fl_tam_l_story_mra,3))/2;
contra_tam_f_mra=(nanmean(averaged_normalized.f.fr_tam_l_story_mra,3)+nanmean(averaged_normalized.f.fl_tam_r_story_mra,3))/2;

%% sam b
ipsi_sam_b_mra=(nanmean(averaged_normalized.b.fr_sam_r_story_mra,3)+nanmean(averaged_normalized.b.fl_sam_l_story_mra,3))/2;
contra_sam_b_mra=(nanmean(averaged_normalized.b.fr_sam_l_story_mra,3)+nanmean(averaged_normalized.b.fl_sam_r_story_mra,3))/2;
%% sam f
ipsi_sam_f_mra=(nanmean(averaged_normalized.f.fr_sam_r_story_mra,3)+nanmean(averaged_normalized.f.fl_sam_l_story_mra,3))/2;
contra_sam_f_mra=(nanmean(averaged_normalized.f.fr_sam_l_story_mra,3)+nanmean(averaged_normalized.f.fl_sam_r_story_mra,3))/2;

group1= [1:8,13,14]; % 10 young
group2=[9:12,15:21]; % 11 bestage
ageGroup(group1)={'young'};
ageGroup(group2)={'old'};

T_complete=table(ipsi_pam_b,ipsi_pam_f,contra_pam_b,contra_pam_f,ipsi_aam_b,ipsi_aam_f,contra_aam_b,contra_aam_f,ipsi_tam_b,ipsi_tam_f,contra_tam_b,contra_tam_f,...
    ipsi_sam_b,ipsi_sam_f,contra_sam_b,contra_sam_f,...
    ipsi_pam_b_mra,contra_pam_b_mra,ipsi_pam_f_mra,contra_pam_f_mra,ipsi_aam_b_mra,contra_aam_b_mra,...
    ipsi_aam_f_mra,contra_aam_f_mra,ipsi_tam_b_mra,contra_tam_b_mra,ipsi_tam_f_mra,...
    contra_tam_f_mra,ipsi_sam_b_mra,contra_sam_b_mra,ipsi_sam_f_mra,contra_sam_f_mra,...
    ageGroup');
T_complete.Properties.VariableNames{end} = 'ageGroup';

