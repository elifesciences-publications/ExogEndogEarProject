clear all;close all;clc;
%% Groups normalized data from exp4 to ipsi/contralateral responses
%% used for statistical inference and plotting


load('exp4_averaged_normalized_timesignal_artfilt.mat')
group1= [1:8,13,14]; % 10 young
group2=[9:12,15:21]; % 11 bestage
ageGroup(group1)={'young'};
ageGroup(group2)={'old'};



ipsi_pam_b=(averaged_normalized.b.fr_pam_r_story+averaged_normalized.b.fl_pam_l_story)/2;
ipsi_aam_b=(averaged_normalized.b.fr_aam_r_story+averaged_normalized.b.fl_aam_l_story)/2;
ipsi_tam_b=(averaged_normalized.b.fr_tam_r_story+averaged_normalized.b.fl_tam_l_story)/2;
ipsi_sam_b=(averaged_normalized.b.fr_sam_r_story+averaged_normalized.b.fl_sam_l_story)/2;

ipsi_pam_f=(averaged_normalized.f.fr_pam_r_story+averaged_normalized.f.fl_pam_l_story)/2;
ipsi_aam_f=(averaged_normalized.f.fr_aam_r_story+averaged_normalized.f.fl_aam_l_story)/2;
ipsi_tam_f=(averaged_normalized.f.fr_tam_r_story+averaged_normalized.f.fl_tam_l_story)/2;
ipsi_sam_f=(averaged_normalized.f.fr_sam_r_story+averaged_normalized.f.fl_sam_l_story)/2;
   
contra_pam_b=(averaged_normalized.b.fl_pam_r_story+averaged_normalized.b.fr_pam_l_story)/2;
contra_aam_b=(averaged_normalized.b.fl_aam_r_story+averaged_normalized.b.fr_aam_l_story)/2;
contra_tam_b=(averaged_normalized.b.fl_tam_r_story+averaged_normalized.b.fr_tam_l_story)/2;
contra_sam_b=(averaged_normalized.b.fl_sam_r_story+averaged_normalized.b.fr_sam_l_story)/2;

contra_pam_f=(averaged_normalized.f.fl_pam_r_story+averaged_normalized.f.fr_pam_l_story)/2;
contra_aam_f=(averaged_normalized.f.fl_aam_r_story+averaged_normalized.f.fr_aam_l_story)/2;
contra_tam_f=(averaged_normalized.f.fl_tam_r_story+averaged_normalized.f.fr_tam_l_story)/2;   
contra_sam_f=(averaged_normalized.f.fl_sam_r_story+averaged_normalized.f.fr_sam_l_story)/2;
  


T_timesignal=table(ipsi_pam_b,ipsi_pam_f,contra_pam_b,contra_pam_f,ipsi_aam_b,ipsi_aam_f,contra_aam_b,contra_aam_f,ipsi_tam_b,ipsi_tam_f,contra_tam_b,contra_tam_f,...
    ipsi_sam_b,ipsi_sam_f,contra_sam_b,contra_sam_f,ageGroup');
T_timesignal.Properties.VariableNames{end} = 'ageGroup';

clearvars -except T_timesignal

load('exp4_averaged_normalized_mra_artfilt.mat')
group1= [1:8,13,14]; % 10 young
group2=[9:12,15:21]; % 11 bestage
ageGroup(group1)={'young'};
ageGroup(group2)={'old'};


ipsi_pam_b=(averaged_normalized.b.fr_pam_r_story+averaged_normalized.b.fl_pam_l_story)/2;
ipsi_aam_b=(averaged_normalized.b.fr_aam_r_story+averaged_normalized.b.fl_aam_l_story)/2;
ipsi_tam_b=(averaged_normalized.b.fr_tam_r_story+averaged_normalized.b.fl_tam_l_story)/2;
ipsi_sam_b=(averaged_normalized.b.fr_sam_r_story+averaged_normalized.b.fl_sam_l_story)/2;

ipsi_pam_f=(averaged_normalized.f.fr_pam_r_story+averaged_normalized.f.fl_pam_l_story)/2;
ipsi_aam_f=(averaged_normalized.f.fr_aam_r_story+averaged_normalized.f.fl_aam_l_story)/2;
ipsi_tam_f=(averaged_normalized.f.fr_tam_r_story+averaged_normalized.f.fl_tam_l_story)/2;
ipsi_sam_f=(averaged_normalized.f.fr_sam_r_story+averaged_normalized.f.fl_sam_l_story)/2;
   
contra_pam_b=(averaged_normalized.b.fl_pam_r_story+averaged_normalized.b.fr_pam_l_story)/2;
contra_aam_b=(averaged_normalized.b.fl_aam_r_story+averaged_normalized.b.fr_aam_l_story)/2;
contra_tam_b=(averaged_normalized.b.fl_tam_r_story+averaged_normalized.b.fr_tam_l_story)/2;
contra_sam_b=(averaged_normalized.b.fl_sam_r_story+averaged_normalized.b.fr_sam_l_story)/2;

contra_pam_f=(averaged_normalized.f.fl_pam_r_story+averaged_normalized.f.fr_pam_l_story)/2;
contra_aam_f=(averaged_normalized.f.fl_aam_r_story+averaged_normalized.f.fr_aam_l_story)/2;
contra_tam_f=(averaged_normalized.f.fl_tam_r_story+averaged_normalized.f.fr_tam_l_story)/2;   
contra_sam_f=(averaged_normalized.f.fl_sam_r_story+averaged_normalized.f.fr_sam_l_story)/2;
  



T_mra=table(ipsi_pam_b,ipsi_pam_f,contra_pam_b,contra_pam_f,ipsi_aam_b,ipsi_aam_f,contra_aam_b,contra_aam_f,ipsi_tam_b,ipsi_tam_f,contra_tam_b,contra_tam_f,...
    ipsi_sam_b,ipsi_sam_f,contra_sam_b,contra_sam_f,ageGroup');
T_mra.Properties.VariableNames{end} = 'ageGroup';

clearvars -except T_timesignal T_mra
