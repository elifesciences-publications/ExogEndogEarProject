%% Normalizes averaged exp4 values:
%% reference value for normalization is each subject's
%% largest value across all four measurment condition.
%% Normalization is done for each muscle and channel separately.



for subj= 1:size(averaged_raw.b.fr_pam_r_story,1)
      %% b +f
%% pam
tmp=[averaged_raw.b.fr_pam_r_story(subj,:);averaged_raw.b.fl_pam_r_story(subj,:);averaged_raw.f.fr_pam_r_story(subj,:);averaged_raw.f.fl_pam_r_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_pam_r_story(subj,:)=averaged_raw.b.fr_pam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_pam_r_story(subj,:)=averaged_raw.b.fl_pam_r_story(subj,:)./maxval;
 averaged_normalized.f.fr_pam_r_story(subj,:)=averaged_raw.f.fr_pam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_pam_r_story(subj,:)=averaged_raw.f.fl_pam_r_story(subj,:)./maxval;
 
 
 tmp=[averaged_raw.b.fr_pam_l_story(subj,:);averaged_raw.b.fl_pam_l_story(subj,:);averaged_raw.f.fr_pam_l_story(subj,:);averaged_raw.f.fl_pam_l_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_pam_l_story(subj,:)=averaged_raw.b.fr_pam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_pam_l_story(subj,:)=averaged_raw.b.fl_pam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_pam_l_story(subj,:)=averaged_raw.f.fr_pam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_pam_l_story(subj,:)=averaged_raw.f.fl_pam_l_story(subj,:)./maxval;

%% aam
tmp=[averaged_raw.b.fr_aam_r_story(subj,:);averaged_raw.b.fl_aam_r_story(subj,:);averaged_raw.f.fr_aam_r_story(subj,:);averaged_raw.f.fl_aam_r_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_aam_r_story(subj,:)=averaged_raw.b.fr_aam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_aam_r_story(subj,:)=averaged_raw.b.fl_aam_r_story(subj,:)./maxval;
  averaged_normalized.f.fr_aam_r_story(subj,:)=averaged_raw.f.fr_aam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_aam_r_story(subj,:)=averaged_raw.f.fl_aam_r_story(subj,:)./maxval;
 
 
 tmp=[averaged_raw.b.fr_aam_l_story(subj,:);averaged_raw.b.fl_aam_l_story(subj,:);averaged_raw.f.fr_aam_l_story(subj,:);averaged_raw.f.fl_aam_l_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_aam_l_story(subj,:)=averaged_raw.b.fr_aam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_aam_l_story(subj,:)=averaged_raw.b.fl_aam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_aam_l_story(subj,:)=averaged_raw.f.fr_aam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_aam_l_story(subj,:)=averaged_raw.f.fl_aam_l_story(subj,:)./maxval;
 
 
 %% tam
tmp=[averaged_raw.b.fr_tam_r_story(subj,:);averaged_raw.b.fl_tam_r_story(subj,:);averaged_raw.f.fr_tam_r_story(subj,:);averaged_raw.f.fl_tam_r_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_tam_r_story(subj,:)=averaged_raw.b.fr_tam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_tam_r_story(subj,:)=averaged_raw.b.fl_tam_r_story(subj,:)./maxval;
  averaged_normalized.f.fr_tam_r_story(subj,:)=averaged_raw.f.fr_tam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_tam_r_story(subj,:)=averaged_raw.f.fl_tam_r_story(subj,:)./maxval;
 
 
 tmp=[averaged_raw.b.fr_tam_l_story(subj,:);averaged_raw.b.fl_tam_l_story(subj,:);averaged_raw.f.fr_tam_l_story(subj,:);averaged_raw.f.fl_tam_l_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_tam_l_story(subj,:)=averaged_raw.b.fr_tam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_tam_l_story(subj,:)=averaged_raw.b.fl_tam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_tam_l_story(subj,:)=averaged_raw.f.fr_tam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_tam_l_story(subj,:)=averaged_raw.f.fl_tam_l_story(subj,:)./maxval;
 
 %% sam
tmp=[averaged_raw.b.fr_sam_r_story(subj,:);averaged_raw.b.fl_sam_r_story(subj,:);averaged_raw.f.fr_sam_r_story(subj,:);averaged_raw.f.fl_sam_r_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_sam_r_story(subj,:)=averaged_raw.b.fr_sam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_sam_r_story(subj,:)=averaged_raw.b.fl_sam_r_story(subj,:)./maxval;
  averaged_normalized.f.fr_sam_r_story(subj,:)=averaged_raw.f.fr_sam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_sam_r_story(subj,:)=averaged_raw.f.fl_sam_r_story(subj,:)./maxval;
 
 
 tmp=[averaged_raw.b.fr_sam_l_story(subj,:);averaged_raw.b.fl_sam_l_story(subj,:);averaged_raw.f.fr_sam_l_story(subj,:);averaged_raw.f.fl_sam_l_story(subj,:)];
 maxval=max(tmp);
 averaged_normalized.b.fr_sam_l_story(subj,:)=averaged_raw.b.fr_sam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_sam_l_story(subj,:)=averaged_raw.b.fl_sam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_sam_l_story(subj,:)=averaged_raw.f.fr_sam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_sam_l_story(subj,:)=averaged_raw.f.fl_sam_l_story(subj,:)./maxval;


end