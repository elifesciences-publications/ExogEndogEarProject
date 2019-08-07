for subj= 1:size(averaged_raw.b.fr_pam_r_story,1)

%% - - - - - - - - - - - - - Right Channel - - - - - - - - - - - - -
%% pam time signal
tmp=[nanmean(averaged_raw.b.fr_pam_r_story(subj,:));nanmean(averaged_raw.b.fl_pam_r_story(subj,:));...
     nanmean(averaged_raw.f.fr_pam_r_story(subj,:));nanmean(averaged_raw.f.fl_pam_r_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_pam_r_story(subj,:)=averaged_raw.b.fr_pam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_pam_r_story(subj,:)=averaged_raw.b.fl_pam_r_story(subj,:)./maxval;
 averaged_normalized.f.fr_pam_r_story(subj,:)=averaged_raw.f.fr_pam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_pam_r_story(subj,:)=averaged_raw.f.fl_pam_r_story(subj,:)./maxval; 
 %% pam mra
 tmp=[nanmean(averaged_raw.b.fr_pam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_pam_r_story_mra(subj,:,:),3);...
      nanmean(averaged_raw.f.fr_pam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_pam_r_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_pam_r_story_mra(subj,:,:)=averaged_raw.b.fr_pam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_pam_r_story_mra(subj,:,:)=averaged_raw.b.fl_pam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_pam_r_story_mra(subj,:,:)=averaged_raw.f.fr_pam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_pam_r_story_mra(subj,:,:)=averaged_raw.f.fl_pam_r_story_mra(subj,:,:)./maxval;
 %% aam time signal
tmp=[nanmean(averaged_raw.b.fr_aam_r_story(subj,:));nanmean(averaged_raw.b.fl_aam_r_story(subj,:));...
     nanmean(averaged_raw.f.fr_aam_r_story(subj,:));nanmean(averaged_raw.f.fl_aam_r_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_aam_r_story(subj,:)=averaged_raw.b.fr_aam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_aam_r_story(subj,:)=averaged_raw.b.fl_aam_r_story(subj,:)./maxval;
 averaged_normalized.f.fr_aam_r_story(subj,:)=averaged_raw.f.fr_aam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_aam_r_story(subj,:)=averaged_raw.f.fl_aam_r_story(subj,:)./maxval;
 %% aam mra
 tmp=[nanmean(averaged_raw.b.fr_aam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_aam_r_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_aam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_aam_r_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_aam_r_story_mra(subj,:,:)=averaged_raw.b.fr_aam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_aam_r_story_mra(subj,:,:)=averaged_raw.b.fl_aam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_aam_r_story_mra(subj,:,:)=averaged_raw.f.fr_aam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_aam_r_story_mra(subj,:,:)=averaged_raw.f.fl_aam_r_story_mra(subj,:,:)./maxval;
%% sam time signal
tmp=[nanmean(averaged_raw.b.fr_sam_r_story(subj,:));nanmean(averaged_raw.b.fl_sam_r_story(subj,:));...
     nanmean(averaged_raw.f.fr_sam_r_story(subj,:));nanmean(averaged_raw.f.fl_sam_r_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_sam_r_story(subj,:)=averaged_raw.b.fr_sam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_sam_r_story(subj,:)=averaged_raw.b.fl_sam_r_story(subj,:)./maxval;
 averaged_normalized.f.fr_sam_r_story(subj,:)=averaged_raw.f.fr_sam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_sam_r_story(subj,:)=averaged_raw.f.fl_sam_r_story(subj,:)./maxval;
 %% sam mra
 tmp=[nanmean(averaged_raw.b.fr_sam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_sam_r_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_sam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_sam_r_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_sam_r_story_mra(subj,:,:)=averaged_raw.b.fr_sam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_sam_r_story_mra(subj,:,:)=averaged_raw.b.fl_sam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_sam_r_story_mra(subj,:,:)=averaged_raw.f.fr_sam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_sam_r_story_mra(subj,:,:)=averaged_raw.f.fl_sam_r_story_mra(subj,:,:)./maxval;
%% tam time signal
tmp=[nanmean(averaged_raw.b.fr_tam_r_story(subj,:));nanmean(averaged_raw.b.fl_tam_r_story(subj,:));...
     nanmean(averaged_raw.f.fr_tam_r_story(subj,:));nanmean(averaged_raw.f.fl_tam_r_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_tam_r_story(subj,:)=averaged_raw.b.fr_tam_r_story(subj,:)./maxval;
 averaged_normalized.b.fl_tam_r_story(subj,:)=averaged_raw.b.fl_tam_r_story(subj,:)./maxval;
 averaged_normalized.f.fr_tam_r_story(subj,:)=averaged_raw.f.fr_tam_r_story(subj,:)./maxval;
 averaged_normalized.f.fl_tam_r_story(subj,:)=averaged_raw.f.fl_tam_r_story(subj,:)./maxval;
 %% tam mra
 tmp=[nanmean(averaged_raw.b.fr_tam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_tam_r_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_tam_r_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_tam_r_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_tam_r_story_mra(subj,:,:)=averaged_raw.b.fr_tam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_tam_r_story_mra(subj,:,:)=averaged_raw.b.fl_tam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_tam_r_story_mra(subj,:,:)=averaged_raw.f.fr_tam_r_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_tam_r_story_mra(subj,:,:)=averaged_raw.f.fl_tam_r_story_mra(subj,:,:)./maxval;
 
%% - - - - - - - - - - - - - Left Channel - - - - - - - - - - - - -
%% pam time signal
tmp=[nanmean(averaged_raw.b.fr_pam_l_story(subj,:));nanmean(averaged_raw.b.fl_pam_l_story(subj,:));...
     nanmean(averaged_raw.f.fr_pam_l_story(subj,:));nanmean(averaged_raw.f.fl_pam_l_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_pam_l_story(subj,:)=averaged_raw.b.fr_pam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_pam_l_story(subj,:)=averaged_raw.b.fl_pam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_pam_l_story(subj,:)=averaged_raw.f.fr_pam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_pam_l_story(subj,:)=averaged_raw.f.fl_pam_l_story(subj,:)./maxval; 
 %% pam mra
 tmp=[nanmean(averaged_raw.b.fr_pam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_pam_l_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_pam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_pam_l_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_pam_l_story_mra(subj,:,:)=averaged_raw.b.fr_pam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_pam_l_story_mra(subj,:,:)=averaged_raw.b.fl_pam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_pam_l_story_mra(subj,:,:)=averaged_raw.f.fr_pam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_pam_l_story_mra(subj,:,:)=averaged_raw.f.fl_pam_l_story_mra(subj,:,:)./maxval;
 %% aam time signal
tmp=[nanmean(averaged_raw.b.fr_aam_l_story(subj,:));nanmean(averaged_raw.b.fl_aam_l_story(subj,:));...
     nanmean(averaged_raw.f.fr_aam_l_story(subj,:));nanmean(averaged_raw.f.fl_aam_l_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_aam_l_story(subj,:)=averaged_raw.b.fr_aam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_aam_l_story(subj,:)=averaged_raw.b.fl_aam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_aam_l_story(subj,:)=averaged_raw.f.fr_aam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_aam_l_story(subj,:)=averaged_raw.f.fl_aam_l_story(subj,:)./maxval;
 %% aam mra
 tmp=[nanmean(averaged_raw.b.fr_aam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_aam_l_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_aam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_aam_l_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_aam_l_story_mra(subj,:,:)=averaged_raw.b.fr_aam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_aam_l_story_mra(subj,:,:)=averaged_raw.b.fl_aam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_aam_l_story_mra(subj,:,:)=averaged_raw.f.fr_aam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_aam_l_story_mra(subj,:,:)=averaged_raw.f.fl_aam_l_story_mra(subj,:,:)./maxval;
%% sam time signal
tmp=[nanmean(averaged_raw.b.fr_sam_l_story(subj,:));nanmean(averaged_raw.b.fl_sam_l_story(subj,:));...
     nanmean(averaged_raw.f.fr_sam_l_story(subj,:));nanmean(averaged_raw.f.fl_sam_l_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_sam_l_story(subj,:)=averaged_raw.b.fr_sam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_sam_l_story(subj,:)=averaged_raw.b.fl_sam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_sam_l_story(subj,:)=averaged_raw.f.fr_sam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_sam_l_story(subj,:)=averaged_raw.f.fl_sam_l_story(subj,:)./maxval;
 %% sam mra
 tmp=[nanmean(averaged_raw.b.fr_sam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_sam_l_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_sam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_sam_l_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_sam_l_story_mra(subj,:,:)=averaged_raw.b.fr_sam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_sam_l_story_mra(subj,:,:)=averaged_raw.b.fl_sam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_sam_l_story_mra(subj,:,:)=averaged_raw.f.fr_sam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_sam_l_story_mra(subj,:,:)=averaged_raw.f.fl_sam_l_story_mra(subj,:,:)./maxval;
%% tam time signal
tmp=[nanmean(averaged_raw.b.fr_tam_l_story(subj,:));nanmean(averaged_raw.b.fl_tam_l_story(subj,:));...
     nanmean(averaged_raw.f.fr_tam_l_story(subj,:));nanmean(averaged_raw.f.fl_tam_l_story(subj,:))];
  maxval=max(tmp);
 averaged_normalized.b.fr_tam_l_story(subj,:)=averaged_raw.b.fr_tam_l_story(subj,:)./maxval;
 averaged_normalized.b.fl_tam_l_story(subj,:)=averaged_raw.b.fl_tam_l_story(subj,:)./maxval;
 averaged_normalized.f.fr_tam_l_story(subj,:)=averaged_raw.f.fr_tam_l_story(subj,:)./maxval;
 averaged_normalized.f.fl_tam_l_story(subj,:)=averaged_raw.f.fl_tam_l_story(subj,:)./maxval;
 %% tam mra
 tmp=[nanmean(averaged_raw.b.fr_tam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.b.fl_tam_l_story_mra(subj,:,:),3);...
     nanmean(averaged_raw.f.fr_tam_l_story_mra(subj,:,:),3);nanmean(averaged_raw.f.fl_tam_l_story_mra(subj,:,:),3)];
  maxval=max(tmp);
 averaged_normalized.b.fr_tam_l_story_mra(subj,:,:)=averaged_raw.b.fr_tam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.b.fl_tam_l_story_mra(subj,:,:)=averaged_raw.b.fl_tam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fr_tam_l_story_mra(subj,:,:)=averaged_raw.f.fr_tam_l_story_mra(subj,:,:)./maxval;
 averaged_normalized.f.fl_tam_l_story_mra(subj,:,:)=averaged_raw.f.fl_tam_l_story_mra(subj,:,:)./maxval;

end







pam_r_signal_rejection=[averaged_raw.f.fr_pam_r_rejection;...
averaged_raw.b.fr_pam_r_rejection;...
averaged_raw.f.fl_pam_r_rejection;...
averaged_raw.b.fl_pam_r_rejection];

pam_l_signal_rejection=[averaged_raw.f.fr_pam_l_rejection;...
averaged_raw.f.fl_pam_l_rejection;...
averaged_raw.b.fr_pam_l_rejection;...
averaged_raw.b.fl_pam_l_rejection];

aam_r_signal_rejection=[averaged_raw.f.fr_aam_r_rejection;...
averaged_raw.b.fr_aam_r_rejection;...
averaged_raw.f.fl_aam_r_rejection;...
averaged_raw.b.fl_aam_r_rejection];


aam_l_signal_rejection=[averaged_raw.f.fr_aam_l_rejection;...
averaged_raw.f.fl_aam_l_rejection;...
averaged_raw.b.fr_aam_l_rejection;...
averaged_raw.b.fl_aam_l_rejection];


sam_r_signal_rejection=[averaged_raw.f.fr_sam_r_rejection;...
averaged_raw.b.fr_sam_r_rejection;...
averaged_raw.f.fl_sam_r_rejection;...
averaged_raw.b.fl_sam_r_rejection];


sam_l_signal_rejection=[averaged_raw.f.fr_sam_l_rejection;...
averaged_raw.f.fl_sam_l_rejection;...
averaged_raw.b.fr_sam_l_rejection;...
averaged_raw.b.fl_sam_l_rejection];

tam_r_signal_rejection=[averaged_raw.f.fr_tam_r_rejection;...
averaged_raw.b.fr_tam_r_rejection;...
averaged_raw.f.fl_tam_r_rejection;...
averaged_raw.b.fl_tam_r_rejection];


tam_l_signal_rejection=[averaged_raw.f.fr_tam_l_rejection;...
averaged_raw.f.fl_tam_l_rejection;...
averaged_raw.b.fr_tam_l_rejection;...
averaged_raw.b.fl_tam_l_rejection];

xAxisString=[{'combined'},{'channel'},{'SCM'},{'HEOG'}];
fntSize=14;
figure
suptitle('n=84 (21 subjects * 2 left/right * 2 anteriority )')

% pam
subplot(4,2,1)
boxplot(pam_l_signal_rejection)
hold on
plot(mean(pam_l_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('pam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,2)
boxplot(pam_r_signal_rejection)
hold on
plot(mean(pam_r_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('pam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% aam
subplot(4,2,3)
boxplot(aam_l_signal_rejection)
hold on
plot(mean(aam_l_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('aam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,4)
boxplot(aam_r_signal_rejection)
hold on
plot(mean(aam_r_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('aam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% tam
subplot(4,2,5)
boxplot(tam_l_signal_rejection)
hold on
plot(mean(tam_l_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('tam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,6)
boxplot(tam_r_signal_rejection)
hold on
plot(mean(tam_r_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('tam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% sam
subplot(4,2,7)
boxplot(sam_l_signal_rejection)
hold on
plot(mean(sam_l_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('sam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,8)
boxplot(sam_r_signal_rejection)
hold on
plot(mean(sam_r_signal_rejection),'o','Color','black')
set(gca,'XTickLabel',xAxisString)
title('sam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor
%%------------------------------------------------------------------------------------------------

pam_r_signal_mra_rejection=[averaged_raw.f.fr_pam_r_mra_rejection;...
averaged_raw.b.fr_pam_r_mra_rejection;...
averaged_raw.f.fl_pam_r_mra_rejection;...
averaged_raw.b.fl_pam_r_mra_rejection];

pam_l_signal_mra_rejection=[averaged_raw.f.fr_pam_l_mra_rejection;...
averaged_raw.f.fl_pam_l_mra_rejection;...
averaged_raw.b.fr_pam_l_mra_rejection;...
averaged_raw.b.fl_pam_l_mra_rejection];

aam_r_signal_mra_rejection=[averaged_raw.f.fr_aam_r_mra_rejection;...
averaged_raw.b.fr_aam_r_mra_rejection;...
averaged_raw.f.fl_aam_r_mra_rejection;...
averaged_raw.b.fl_aam_r_mra_rejection];


aam_l_signal_mra_rejection=[averaged_raw.f.fr_aam_l_mra_rejection;...
averaged_raw.f.fl_aam_l_mra_rejection;...
averaged_raw.b.fr_aam_l_mra_rejection;...
averaged_raw.b.fl_aam_l_mra_rejection];


sam_r_signal_mra_rejection=[averaged_raw.f.fr_sam_r_mra_rejection;...
averaged_raw.b.fr_sam_r_mra_rejection;...
averaged_raw.f.fl_sam_r_mra_rejection;...
averaged_raw.b.fl_sam_r_mra_rejection];


sam_l_signal_mra_rejection=[averaged_raw.f.fr_sam_l_mra_rejection;...
averaged_raw.f.fl_sam_l_mra_rejection;...
averaged_raw.b.fr_sam_l_mra_rejection;...
averaged_raw.b.fl_sam_l_mra_rejection];

tam_r_signal_mra_rejection=[averaged_raw.f.fr_tam_r_mra_rejection;...
averaged_raw.b.fr_tam_r_mra_rejection;...
averaged_raw.f.fl_tam_r_mra_rejection;...
averaged_raw.b.fl_tam_r_mra_rejection];


tam_l_signal_mra_rejection=[averaged_raw.f.fr_tam_l_mra_rejection;...
averaged_raw.f.fl_tam_l_mra_rejection;...
averaged_raw.b.fr_tam_l_mra_rejection;...
averaged_raw.b.fl_tam_l_mra_rejection];

figure
suptitle('combined only')
% pam
subplot(4,2,1)
boxplot(pam_l_signal_mra_rejection(:,:,1))
hold on
plot(mean(pam_l_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('pam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,2)
boxplot(pam_r_signal_mra_rejection(:,:,1))
hold on
plot(mean(pam_r_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('pam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% aam
subplot(4,2,3)
boxplot(aam_l_signal_mra_rejection(:,:,1))
hold on
plot(mean(aam_l_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('aam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,4)
boxplot(aam_r_signal_mra_rejection(:,:,1))
hold on
plot(mean(aam_r_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('aam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% tam
subplot(4,2,5)
boxplot(tam_l_signal_mra_rejection(:,:,1))
hold on
plot(mean(tam_l_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('tam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,6)
boxplot(tam_r_signal_mra_rejection(:,:,1))
hold on
plot(mean(tam_r_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('tam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

% sam
subplot(4,2,7)
boxplot(sam_l_signal_mra_rejection(:,:,1))
hold on
plot(mean(sam_l_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('sam l rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor

subplot(4,2,8)
boxplot(sam_r_signal_mra_rejection(:,:,1))
hold on
plot(mean(sam_r_signal_mra_rejection(:,:,1)),'o','Color','black')
xlabel('subband')
title('sam r rejection')
ylabel('% rejected')
set(gca,'FontSize',fntSize)
grid on;grid minor
