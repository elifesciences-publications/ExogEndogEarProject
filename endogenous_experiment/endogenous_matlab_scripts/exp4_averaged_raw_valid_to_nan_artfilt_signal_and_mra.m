%% sets as artifacts flagged segments to NaN
%% segments that are flagged by either the auricular channel itself, 
%% the M.SCM channel or the EOG are treated as artifacts

nSubbands=8;
%%_______________________________________________________________________
%%                              BACK
%%_______________________________________________________________________

%% ---------------------------------------- pam
%%  1 - - FR LC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_pam_l_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_pam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_pam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_pam_l_story,2)./size(averaged_raw.b.valid_fr_pam_l_story,2))*100;
% scm
averaged_raw.b.fr_pam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_pam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_pam_l_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_pam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_pam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_pam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_pam_l_story_mra,3)./size(averaged_raw.b.valid_fr_pam_l_story_mra,3))*100;
% scm
averaged_raw.b.fr_pam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_pam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_pam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_pam_r_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_pam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_pam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_pam_r_story,2)./size(averaged_raw.b.valid_fr_pam_r_story,2))*100;
% scm
averaged_raw.b.fr_pam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_pam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_pam_r_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_pam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_pam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_pam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_pam_r_story_mra,3)./size(averaged_raw.b.valid_fr_pam_r_story_mra,3))*100;
% scm
averaged_raw.b.fr_pam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_pam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_pam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_pam_l_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_pam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_pam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_pam_l_story,2)./size(averaged_raw.b.valid_fl_pam_l_story,2))*100;
% scm
averaged_raw.b.fl_pam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_pam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_pam_l_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_pam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_pam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_pam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_pam_l_story_mra,3)./size(averaged_raw.b.valid_fl_pam_l_story_mra,3))*100;
% scm
averaged_raw.b.fl_pam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_pam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_pam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_pam_r_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_pam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_pam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_pam_r_story,2)./size(averaged_raw.b.valid_fl_pam_r_story,2))*100;
% scm
averaged_raw.b.fl_pam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_pam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_pam_r_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_pam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_pam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_pam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_pam_r_story_mra,3)./size(averaged_raw.b.valid_fl_pam_r_story_mra,3))*100;
% scm
averaged_raw.b.fl_pam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_pam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_pam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- aam

%%  1 - - FR LC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_aam_l_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_aam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_aam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_aam_l_story,2)./size(averaged_raw.b.valid_fr_aam_l_story,2))*100;
% scm
averaged_raw.b.fr_aam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_aam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_aam_l_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_aam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_aam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_aam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_aam_l_story_mra,3)./size(averaged_raw.b.valid_fr_aam_l_story_mra,3))*100;
% scm
averaged_raw.b.fr_aam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_aam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_aam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_aam_r_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_aam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_aam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_aam_r_story,2)./size(averaged_raw.b.valid_fr_aam_r_story,2))*100;
% scm
averaged_raw.b.fr_aam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_aam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_aam_r_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_aam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_aam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_aam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_aam_r_story_mra,3)./size(averaged_raw.b.valid_fr_aam_r_story_mra,3))*100;
% scm
averaged_raw.b.fr_aam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_aam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_aam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_aam_l_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_aam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_aam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_aam_l_story,2)./size(averaged_raw.b.valid_fl_aam_l_story,2))*100;
% scm
averaged_raw.b.fl_aam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_aam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_aam_l_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_aam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_aam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_aam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_aam_l_story_mra,3)./size(averaged_raw.b.valid_fl_aam_l_story_mra,3))*100;
% scm
averaged_raw.b.fl_aam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_aam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_aam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_aam_r_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_aam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_aam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_aam_r_story,2)./size(averaged_raw.b.valid_fl_aam_r_story,2))*100;
% scm
averaged_raw.b.fl_aam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_aam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_aam_r_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_aam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_aam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_aam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_aam_r_story_mra,3)./size(averaged_raw.b.valid_fl_aam_r_story_mra,3))*100;
% scm
averaged_raw.b.fl_aam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_aam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_aam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- tam

%%  1 - - FR LC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_tam_l_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_tam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_tam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_tam_l_story,2)./size(averaged_raw.b.valid_fr_tam_l_story,2))*100;
% scm
averaged_raw.b.fr_tam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_tam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_tam_l_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_tam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_tam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_tam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_tam_l_story_mra,3)./size(averaged_raw.b.valid_fr_tam_l_story_mra,3))*100;
% scm
averaged_raw.b.fr_tam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_tam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_tam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_tam_r_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_tam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_tam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_tam_r_story,2)./size(averaged_raw.b.valid_fr_tam_r_story,2))*100;
% scm
averaged_raw.b.fr_tam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_tam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_tam_r_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_tam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_tam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_tam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_tam_r_story_mra,3)./size(averaged_raw.b.valid_fr_tam_r_story_mra,3))*100;
% scm
averaged_raw.b.fr_tam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_tam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_tam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_tam_l_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_tam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_tam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_tam_l_story,2)./size(averaged_raw.b.valid_fl_tam_l_story,2))*100;
% scm
averaged_raw.b.fl_tam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_tam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_tam_l_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_tam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_tam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_tam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_tam_l_story_mra,3)./size(averaged_raw.b.valid_fl_tam_l_story_mra,3))*100;
% scm
averaged_raw.b.fl_tam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_tam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_tam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_tam_r_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_tam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_tam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_tam_r_story,2)./size(averaged_raw.b.valid_fl_tam_r_story,2))*100;
% scm
averaged_raw.b.fl_tam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_tam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_tam_r_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_tam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_tam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_tam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_tam_r_story_mra,3)./size(averaged_raw.b.valid_fl_tam_r_story_mra,3))*100;
% scm
averaged_raw.b.fl_tam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_tam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_tam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- sam


%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_sam_l_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_sam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_sam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_sam_l_story,2)./size(averaged_raw.b.valid_fr_sam_l_story,2))*100;
% scm
averaged_raw.b.fr_sam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_sam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_sam_l_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_sam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_sam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_sam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_sam_l_story_mra,3)./size(averaged_raw.b.valid_fr_sam_l_story_mra,3))*100;
% scm
averaged_raw.b.fr_sam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_sam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_sam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fr_sam_r_story & averaged_raw.b.valid_fr_neck_story & averaged_raw.b.valid_fr_eog_story;
% comb
averaged_raw.b.fr_sam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fr_sam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fr_sam_r_story,2)./size(averaged_raw.b.valid_fr_sam_r_story,2))*100;
% scm
averaged_raw.b.fr_sam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fr_neck_story,2)./size(averaged_raw.b.valid_fr_neck_story,2))*100;
% eog
averaged_raw.b.fr_sam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fr_eog_story,2)./size(averaged_raw.b.valid_fr_eog_story,2))*100;

averaged_raw.b.fr_sam_r_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fr_sam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fr_sam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fr_sam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fr_sam_r_story_mra,3)./size(averaged_raw.b.valid_fr_sam_r_story_mra,3))*100;
% scm
averaged_raw.b.fr_sam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fr_sam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fr_sam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_sam_l_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_sam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_sam_l_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_sam_l_story,2)./size(averaged_raw.b.valid_fl_sam_l_story,2))*100;
% scm
averaged_raw.b.fl_sam_l_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_sam_l_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_sam_l_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_sam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_sam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_sam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_sam_l_story_mra,3)./size(averaged_raw.b.valid_fl_sam_l_story_mra,3))*100;
% scm
averaged_raw.b.fl_sam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_sam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_sam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.b.valid_fl_sam_r_story & averaged_raw.b.valid_fl_neck_story & averaged_raw.b.valid_fl_eog_story;
% comb
averaged_raw.b.fl_sam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.b.fl_sam_r_rejection(:,2)=(1-sum(averaged_raw.b.valid_fl_sam_r_story,2)./size(averaged_raw.b.valid_fl_sam_r_story,2))*100;
% scm
averaged_raw.b.fl_sam_r_rejection(:,3)=(1-sum(averaged_raw.b.valid_fl_neck_story,2)./size(averaged_raw.b.valid_fl_neck_story,2))*100;
% eog
averaged_raw.b.fl_sam_r_rejection(:,4)=(1-sum(averaged_raw.b.valid_fl_eog_story,2)./size(averaged_raw.b.valid_fl_eog_story,2))*100;

averaged_raw.b.fl_sam_r_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.b.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.b.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.b.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.b.valid_fl_sam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.b.fl_sam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.b.fl_sam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.b.valid_fl_sam_r_story_mra,3)./size(averaged_raw.b.valid_fl_sam_r_story_mra,3))*100;
% scm
averaged_raw.b.fl_sam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.b.fl_sam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.b.fl_sam_r_story_mra(~tmpValidMat) = NaN;   



%%_______________________________________________________________________
%%                              FRONT
%%_______________________________________________________________________

%% ---------------------------------------- pam
%%  1 - - FR LC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_pam_l_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_pam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_pam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_pam_l_story,2)./size(averaged_raw.f.valid_fr_pam_l_story,2))*100;
% scm
averaged_raw.f.fr_pam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_pam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_pam_l_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_pam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_pam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_pam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_pam_l_story_mra,3)./size(averaged_raw.f.valid_fr_pam_l_story_mra,3))*100;
% scm
averaged_raw.f.fr_pam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_pam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_pam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_pam_r_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_pam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_pam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_pam_r_story,2)./size(averaged_raw.f.valid_fr_pam_r_story,2))*100;
% scm
averaged_raw.f.fr_pam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_pam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_pam_r_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_pam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_pam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_pam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_pam_r_story_mra,3)./size(averaged_raw.f.valid_fr_pam_r_story_mra,3))*100;
% scm
averaged_raw.f.fr_pam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_pam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_pam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_pam_l_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_pam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_pam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_pam_l_story,2)./size(averaged_raw.f.valid_fl_pam_l_story,2))*100;
% scm
averaged_raw.f.fl_pam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_pam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_pam_l_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_pam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_pam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_pam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_pam_l_story_mra,3)./size(averaged_raw.f.valid_fl_pam_l_story_mra,3))*100;
% scm
averaged_raw.f.fl_pam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_pam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_pam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% pam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_pam_r_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_pam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_pam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_pam_r_story,2)./size(averaged_raw.f.valid_fl_pam_r_story,2))*100;
% scm
averaged_raw.f.fl_pam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_pam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_pam_r_story(~tmpValidMat) = NaN;    

%% pam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_pam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_pam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_pam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_pam_r_story_mra,3)./size(averaged_raw.f.valid_fl_pam_r_story_mra,3))*100;
% scm
averaged_raw.f.fl_pam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_pam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_pam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- aam

%%  1 - - FR LC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_aam_l_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_aam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_aam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_aam_l_story,2)./size(averaged_raw.f.valid_fr_aam_l_story,2))*100;
% scm
averaged_raw.f.fr_aam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_aam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_aam_l_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_aam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_aam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_aam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_aam_l_story_mra,3)./size(averaged_raw.f.valid_fr_aam_l_story_mra,3))*100;
% scm
averaged_raw.f.fr_aam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_aam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_aam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_aam_r_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_aam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_aam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_aam_r_story,2)./size(averaged_raw.f.valid_fr_aam_r_story,2))*100;
% scm
averaged_raw.f.fr_aam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_aam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_aam_r_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_aam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_aam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_aam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_aam_r_story_mra,3)./size(averaged_raw.f.valid_fr_aam_r_story_mra,3))*100;
% scm
averaged_raw.f.fr_aam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_aam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_aam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_aam_l_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_aam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_aam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_aam_l_story,2)./size(averaged_raw.f.valid_fl_aam_l_story,2))*100;
% scm
averaged_raw.f.fl_aam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_aam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_aam_l_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_aam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_aam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_aam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_aam_l_story_mra,3)./size(averaged_raw.f.valid_fl_aam_l_story_mra,3))*100;
% scm
averaged_raw.f.fl_aam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_aam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_aam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% aam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_aam_r_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_aam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_aam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_aam_r_story,2)./size(averaged_raw.f.valid_fl_aam_r_story,2))*100;
% scm
averaged_raw.f.fl_aam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_aam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_aam_r_story(~tmpValidMat) = NaN;    

%% aam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_aam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_aam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_aam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_aam_r_story_mra,3)./size(averaged_raw.f.valid_fl_aam_r_story_mra,3))*100;
% scm
averaged_raw.f.fl_aam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_aam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_aam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- tam

%%  1 - - FR LC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_tam_l_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_tam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_tam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_tam_l_story,2)./size(averaged_raw.f.valid_fr_tam_l_story,2))*100;
% scm
averaged_raw.f.fr_tam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_tam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_tam_l_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_tam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_tam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_tam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_tam_l_story_mra,3)./size(averaged_raw.f.valid_fr_tam_l_story_mra,3))*100;
% scm
averaged_raw.f.fr_tam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_tam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_tam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_tam_r_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_tam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_tam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_tam_r_story,2)./size(averaged_raw.f.valid_fr_tam_r_story,2))*100;
% scm
averaged_raw.f.fr_tam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_tam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_tam_r_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_tam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_tam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_tam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_tam_r_story_mra,3)./size(averaged_raw.f.valid_fr_tam_r_story_mra,3))*100;
% scm
averaged_raw.f.fr_tam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_tam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_tam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_tam_l_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_tam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_tam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_tam_l_story,2)./size(averaged_raw.f.valid_fl_tam_l_story,2))*100;
% scm
averaged_raw.f.fl_tam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_tam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_tam_l_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_tam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_tam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_tam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_tam_l_story_mra,3)./size(averaged_raw.f.valid_fl_tam_l_story_mra,3))*100;
% scm
averaged_raw.f.fl_tam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_tam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_tam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% tam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_tam_r_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_tam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_tam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_tam_r_story,2)./size(averaged_raw.f.valid_fl_tam_r_story,2))*100;
% scm
averaged_raw.f.fl_tam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_tam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_tam_r_story(~tmpValidMat) = NaN;    

%% tam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_tam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_tam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_tam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_tam_r_story_mra,3)./size(averaged_raw.f.valid_fl_tam_r_story_mra,3))*100;
% scm
averaged_raw.f.fl_tam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_tam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_tam_r_story_mra(~tmpValidMat) = NaN;   


%% ---------------------------------------- sam


%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_sam_l_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_sam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_sam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_sam_l_story,2)./size(averaged_raw.f.valid_fr_sam_l_story,2))*100;
% scm
averaged_raw.f.fr_sam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_sam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_sam_l_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_sam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_sam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_sam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_sam_l_story_mra,3)./size(averaged_raw.f.valid_fr_sam_l_story_mra,3))*100;
% scm
averaged_raw.f.fr_sam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_sam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_sam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 2 - - FR RC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fr_sam_r_story & averaged_raw.f.valid_fr_neck_story & averaged_raw.f.valid_fr_eog_story;
% comb
averaged_raw.f.fr_sam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fr_sam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fr_sam_r_story,2)./size(averaged_raw.f.valid_fr_sam_r_story,2))*100;
% scm
averaged_raw.f.fr_sam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fr_neck_story,2)./size(averaged_raw.f.valid_fr_neck_story,2))*100;
% eog
averaged_raw.f.fr_sam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fr_eog_story,2)./size(averaged_raw.f.valid_fr_eog_story,2))*100;

averaged_raw.f.fr_sam_r_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fr_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fr_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fr_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fr_sam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fr_sam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fr_sam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fr_sam_r_story_mra,3)./size(averaged_raw.f.valid_fr_sam_r_story_mra,3))*100;
% scm
averaged_raw.f.fr_sam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fr_sam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fr_sam_r_story_mra(~tmpValidMat) = NaN;   


%% 3 - - FL LC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_sam_l_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_sam_l_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_sam_l_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_sam_l_story,2)./size(averaged_raw.f.valid_fl_sam_l_story,2))*100;
% scm
averaged_raw.f.fl_sam_l_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_sam_l_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_sam_l_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_sam_l_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_sam_l_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_sam_l_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_sam_l_story_mra,3)./size(averaged_raw.f.valid_fl_sam_l_story_mra,3))*100;
% scm
averaged_raw.f.fl_sam_l_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_sam_l_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_sam_l_story_mra(~tmpValidMat) = NaN;

%% ___________________________________________________________________________________________________________________

%% 4 - - FL RC - -
%% sam Time Signal
%%                   Channel                                SCM                                  EOG
tmpValidMat=averaged_raw.f.valid_fl_sam_r_story & averaged_raw.f.valid_fl_neck_story & averaged_raw.f.valid_fl_eog_story;
% comb
averaged_raw.f.fl_sam_r_rejection(:,1)=(1-sum(tmpValidMat,2)./size(tmpValidMat,2))*100;
% channel
averaged_raw.f.fl_sam_r_rejection(:,2)=(1-sum(averaged_raw.f.valid_fl_sam_r_story,2)./size(averaged_raw.f.valid_fl_sam_r_story,2))*100;
% scm
averaged_raw.f.fl_sam_r_rejection(:,3)=(1-sum(averaged_raw.f.valid_fl_neck_story,2)./size(averaged_raw.f.valid_fl_neck_story,2))*100;
% eog
averaged_raw.f.fl_sam_r_rejection(:,4)=(1-sum(averaged_raw.f.valid_fl_eog_story,2)./size(averaged_raw.f.valid_fl_eog_story,2))*100;

averaged_raw.f.fl_sam_r_story(~tmpValidMat) = NaN;    

%% sam MRA
% Prepare SCM
tmpsig1=permute(averaged_raw.f.valid_fl_neck_story,[1,3,2]);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,1,:))') % check equality
tmpsig1=repmat(tmpsig1,1,nSubbands,1);
%isequal(averaged_raw.f.valid_fl_neck_story(10,:),squeeze(tmpsig(10,5,:))') % check equality
% Prepare EOG
tmpsig2=permute(averaged_raw.f.valid_fl_eog_story,[1,3,2]);
tmpsig2=repmat(tmpsig2,1,nSubbands,1);
%%                   Channel                            SCM       EOG
tmpValidMat=averaged_raw.f.valid_fl_sam_r_story_mra & tmpsig1 & tmpsig2;
% comb
averaged_raw.f.fl_sam_r_mra_rejection(:,:,1)=(1-sum(tmpValidMat,3)./size(tmpValidMat,3))*100;
% channel
averaged_raw.f.fl_sam_r_mra_rejection(:,:,2)=(1-sum(averaged_raw.f.valid_fl_sam_r_story_mra,3)./size(averaged_raw.f.valid_fl_sam_r_story_mra,3))*100;
% scm
averaged_raw.f.fl_sam_r_mra_rejection(:,:,3)=(1-sum(tmpsig1,3)./size(tmpsig1,3))*100;
% eog
averaged_raw.f.fl_sam_r_mra_rejection(:,:,4)=(1-sum(tmpsig2,3)./size(tmpsig2,3))*100;

averaged_raw.f.fl_sam_r_story_mra(~tmpValidMat) = NaN;   

clearvars tmpsig1 tmpsig2 tmpValidMat

