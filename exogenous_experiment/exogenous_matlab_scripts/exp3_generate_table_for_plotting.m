clear all;close all;clc;
% dependencies:
%   exp3_results_normalized4x_eog_ecg_ipsiCont.mat


%% This script generates a table T of averaged and downsampled responses
%% for plotting purposes

load('exp3_results_normalized4x_eog_ecg_ipsiCont.mat')

fs=2400;
dsfactor=60; % downsampling factor for plotting
timevec = (linspace(0,siglen/fs,siglen)-(addSamples/fs))*1000;
%%
timeframe=[-500,1500];
%%
indx=find(timevec>timeframe(1) & timevec<timeframe(2));
timevec=timevec(indx);

ylim_min=90; % Percent baseline
ylim_max=125; % Percent baseline

pam_contra_b = (downsample(mean(pam_contra_b(:,indx)),dsfactor)+1)*100;
pam_contra_f = (downsample(mean(pam_contra_f(:,indx)),dsfactor)+1)*100;
pam_ipsi_b   = (downsample(mean(pam_ipsi_b(:,indx)),dsfactor)+1)*100;
pam_ipsi_f   = (downsample(mean(pam_ipsi_f(:,indx)),dsfactor)+1)*100;

aam_contra_b = (downsample(mean(aam_contra_b(:,indx)),dsfactor)+1)*100;
aam_contra_f = (downsample(mean(aam_contra_f(:,indx)),dsfactor)+1)*100;
aam_ipsi_b   = (downsample(mean(aam_ipsi_b(:,indx)),dsfactor)+1)*100;
aam_ipsi_f   = (downsample(mean(aam_ipsi_f(:,indx)),dsfactor)+1)*100;

tam_contra_b = (downsample(mean(tam_contra_b(:,indx)),dsfactor)+1)*100;
tam_contra_f = (downsample(mean(tam_contra_f(:,indx)),dsfactor)+1)*100;
tam_ipsi_b   = (downsample(mean(tam_ipsi_b(:,indx)),dsfactor)+1)*100;
tam_ipsi_f   = (downsample(mean(tam_ipsi_f(:,indx)),dsfactor)+1)*100;

sam_contra_b = (downsample(mean(sam_contra_b(:,indx)),dsfactor)+1)*100;
sam_contra_f = (downsample(mean(sam_contra_f(:,indx)),dsfactor)+1)*100;
sam_ipsi_b   = (downsample(mean(sam_ipsi_b(:,indx)),dsfactor)+1)*100;
sam_ipsi_f   = (downsample(mean(sam_ipsi_f(:,indx)),dsfactor)+1)*100;

timevec=downsample(timevec,dsfactor);


neck_m120_ds=neck_m120(:,:,indx);
neck_m120_ds = (downsample(squeeze(nanmean(squeeze(nanmean(neck_m120_ds,1)),1)),dsfactor)+1)*100;

neck_m30_ds=neck_m30(:,:,indx);
neck_m30_ds = (downsample(squeeze(nanmean(squeeze(nanmean(neck_m30_ds,1)),1)),dsfactor)+1)*100;


neck_p120_ds=neck_p120(:,:,indx);
neck_p120_ds = (downsample(squeeze(nanmean(squeeze(nanmean(neck_p120_ds,1)),1)),dsfactor)+1)*100;

neck_p30_ds=neck_p30(:,:,indx);
neck_p30_ds = (downsample(squeeze(nanmean(squeeze(nanmean(neck_p30_ds,1)),1)),dsfactor)+1)*100;

figure
subplot(2,2,1)
plot(timevec,neck_m30_ds)
subplot(2,2,2)
plot(timevec,neck_p30_ds)
subplot(2,2,3)
plot(timevec,neck_m120_ds)
subplot(2,2,4)
plot(timevec,neck_p120_ds)


eog_m120_ds=eog_m120(:,:,indx);
eog_m120_ds = (downsample(squeeze(nanmean(squeeze(nanmean(eog_m120_ds,1)),1)),dsfactor));

eog_m30_ds=eog_m30(:,:,indx);
eog_m30_ds = (downsample(squeeze(nanmean(squeeze(nanmean(eog_m30_ds,1)),1)),dsfactor));


eog_p120_ds=eog_p120(:,:,indx);
eog_p120_ds = (downsample(squeeze(nanmean(squeeze(nanmean(eog_p120_ds,1)),1)),dsfactor));

eog_p30_ds=eog_p30(:,:,indx);
eog_p30_ds = (downsample(squeeze(nanmean(squeeze(nanmean(eog_p30_ds,1)),1)),dsfactor));


T=table(timevec',pam_contra_b',pam_contra_f',pam_ipsi_b',pam_ipsi_f',aam_contra_b',...
aam_contra_f',aam_ipsi_b',aam_ipsi_f',tam_contra_b',tam_contra_f',tam_ipsi_b',...  
tam_ipsi_f',sam_contra_b',sam_contra_f',sam_ipsi_b',sam_ipsi_f', ...
eog_m120_ds',eog_m30_ds',eog_p120_ds',eog_p30_ds',neck_m120_ds',neck_m30_ds',neck_p120_ds',neck_p30_ds');
T.Properties.VariableNames=[{'timevec'},{'pam_contra_b'},{'pam_contra_f'},{'pam_ipsi_b'},{'pam_ipsi_f'},...   
{'aam_contra_b'},{'aam_contra_f'},{'aam_ipsi_b'},{'aam_ipsi_f'},{'tam_contra_b'},...
{'tam_contra_f'},{'tam_ipsi_b'},{'tam_ipsi_f'},{'sam_contra_b'},{'sam_contra_f'},... 
{'sam_ipsi_b'},{'sam_ipsi_f'},{'eog_m120'},{'eog_m30'},{'eog_p120'},{'eog_p30'},...
{'neck_m120'},{'neck_m30'},{'neck_p120'},{'neck_p30'}];
