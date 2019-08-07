clear all;close all;clc;

%% This function generates a table T_complete of averaged responses in the
%% time range of 100 - 1500 ms for every subject for statistical analysis


load('exp3_results_normalized4x_eog_ecg_ipsiCont.mat') 

group1=[1:3,5:15,20,21];
group2=[4,16:19,22:28];
for cvar1=group1
    labelageGroup{cvar1}='young';  
end
for cvar1=group2
    labelageGroup{cvar1}='old';  
end



fs=2400;
timevec=(linspace(0,siglen/fs,siglen)*1000)-3000;

indx=find(timevec>100 & timevec<1500);

pam_ipsi_b=mean(pam_ipsi_b(:,indx),2);
pam_ipsi_f=mean(pam_ipsi_f(:,indx),2);
pam_contra_b=mean(pam_contra_b(:,indx),2);
pam_contra_f=mean(pam_contra_f(:,indx),2);

aam_ipsi_b=mean(aam_ipsi_b(:,indx),2);
aam_ipsi_f=mean(aam_ipsi_f(:,indx),2);
aam_contra_b=mean(aam_contra_b(:,indx),2);
aam_contra_f=mean(aam_contra_f(:,indx),2);

tam_ipsi_b=mean(tam_ipsi_b(:,indx),2);
tam_ipsi_f=mean(tam_ipsi_f(:,indx),2);
tam_contra_b=mean(tam_contra_b(:,indx),2);
tam_contra_f=mean(tam_contra_f(:,indx),2);

sam_ipsi_b=mean(sam_ipsi_b(:,indx),2);
sam_ipsi_f=mean(sam_ipsi_f(:,indx),2);
sam_contra_b=mean(sam_contra_b(:,indx),2);
sam_contra_f=mean(sam_contra_f(:,indx),2);


T_pam=table(pam_ipsi_b,pam_ipsi_f,pam_contra_b,pam_contra_f,labelageGroup');

T_aam=table(aam_ipsi_b,aam_ipsi_f,aam_contra_b,aam_contra_f,labelageGroup');

T_tam=table(tam_ipsi_b,tam_ipsi_f,tam_contra_b,tam_contra_f,labelageGroup');

T_sam=table(sam_ipsi_b,sam_ipsi_f,sam_contra_b,sam_contra_f,labelageGroup');

T_pam.Properties.VariableNames{5} = 'ageGroup';
T_aam.Properties.VariableNames{5} = 'ageGroup';
T_tam.Properties.VariableNames{5} = 'ageGroup';
T_sam.Properties.VariableNames{5} = 'ageGroup';

T_complete=table(pam_ipsi_b,pam_ipsi_f,pam_contra_b,pam_contra_f,aam_ipsi_b,aam_ipsi_f,aam_contra_b,aam_contra_f,tam_ipsi_b,tam_ipsi_f,tam_contra_b,tam_contra_f,...
    sam_ipsi_b,sam_ipsi_f,sam_contra_b,sam_contra_f,labelageGroup');
T_complete.Properties.VariableNames{end} = 'ageGroup';

writetable(T_complete,'exp3_ipsicont_table_x4')