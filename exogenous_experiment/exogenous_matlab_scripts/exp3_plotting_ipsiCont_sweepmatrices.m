clear all;close all;clc;
% dependencies:
%   exp3_reshape_cube_to_ipsiCont_matrix.m
%   exp3_4x_normalized_cube_eog_ecg.mat


%% This script generates sweepmatrices of ipsi/contralateral single sweep responses of
%% auricular muscles and eog/m.scm 

load('exp3_4x_normalized_cube_eog_ecg.mat')

fntSize=18; % font size

[ipsi_pam_b,contra_pam_b] = exp3_reshape_cube_to_ipsiCont_matrix(pam_rc_p120,pam_lc_m120,pam_rc_m120,pam_lc_p120);
[ipsi_pam_f,contra_pam_f] = exp3_reshape_cube_to_ipsiCont_matrix(pam_rc_p30,pam_lc_m30,pam_rc_m30,pam_lc_p30);

[ipsi_aam_b,contra_aam_b] = exp3_reshape_cube_to_ipsiCont_matrix(aam_rc_p120,aam_lc_m120,aam_rc_m120,aam_lc_p120);
[ipsi_aam_f,contra_aam_f] = exp3_reshape_cube_to_ipsiCont_matrix(aam_rc_p30,aam_lc_m30,aam_rc_m30,aam_lc_p30);

[ipsi_tam_b,contra_tam_b] = exp3_reshape_cube_to_ipsiCont_matrix(tam_rc_p120,tam_lc_m120,tam_rc_m120,tam_lc_p120);
[ipsi_tam_f,contra_tam_f] = exp3_reshape_cube_to_ipsiCont_matrix(tam_rc_p30,tam_lc_m30,tam_rc_m30,tam_lc_p30);

[ipsi_sam_b,contra_sam_b] = exp3_reshape_cube_to_ipsiCont_matrix(sam_rc_p120,sam_lc_m120,sam_rc_m120,sam_lc_p120);
[ipsi_sam_f,contra_sam_f] = exp3_reshape_cube_to_ipsiCont_matrix(sam_rc_p30,sam_lc_m30,sam_rc_m30,sam_lc_p30);

fs=2400;
timevec=linspace(0,size(ipsi_pam_b,2)/fs,size(ipsi_pam_b,2))-(addSamples/fs);
nTrials=size(ipsi_pam_b,1);

figure
st=suptitle('PAM');
st.FontSize=fntSize+10;
subplot(2,2,1)
imagesc(timevec,1:nTrials,ipsi_pam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral front speaker')
set(gca,'FontSize',fntSize)
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')


subplot(2,2,2)
imagesc(timevec,1:nTrials,contra_pam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral front speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,3)
imagesc(timevec,1:nTrials,ipsi_pam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral back speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,4)
imagesc(timevec,1:nTrials,contra_pam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral back speaker')
set(gca,'FontSize',fntSize)


figure
st=suptitle('AAM');
st.FontSize=fntSize+10;
subplot(2,2,1)
imagesc(timevec,1:nTrials,ipsi_aam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral front speaker')
set(gca,'FontSize',fntSize)
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')


subplot(2,2,2)
imagesc(timevec,1:nTrials,contra_aam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral front speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,3)
imagesc(timevec,1:nTrials,ipsi_aam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral back speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,4)
imagesc(timevec,1:nTrials,contra_aam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral back speaker')
set(gca,'FontSize',fntSize)


figure
st=suptitle('TAM');
st.FontSize=fntSize+10;
subplot(2,2,1)
imagesc(timevec,1:nTrials,ipsi_tam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral front speaker')
set(gca,'FontSize',fntSize)
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')


subplot(2,2,2)
imagesc(timevec,1:nTrials,contra_tam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral front speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,3)
imagesc(timevec,1:nTrials,ipsi_tam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral back speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,4)
imagesc(timevec,1:nTrials,contra_tam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral back speaker')
set(gca,'FontSize',fntSize)


figure
st=suptitle('SAM');
st.FontSize=fntSize+10;
subplot(2,2,1)
imagesc(timevec,1:nTrials,ipsi_sam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral front speaker')
set(gca,'FontSize',fntSize)
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')


subplot(2,2,2)
imagesc(timevec,1:nTrials,contra_sam_f)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral front speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,3)
imagesc(timevec,1:nTrials,ipsi_sam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('ipsilateral back speaker')
set(gca,'FontSize',fntSize)

subplot(2,2,4)
imagesc(timevec,1:nTrials,contra_sam_b)
caxis([-1,1])
colormap(hot)
h=colorbar;
ylabel(h,'normalized amplitude')
xlabel('time [s]')
ylabel('trials')
title('contralateral back speaker')
set(gca,'FontSize',fntSize)


%% EMG & EOG

   figure
   st=suptitle('M.SCM');
   st.FontSize=fntSize+10;
   subplot(2,2,1)
   tmp=permute(neck_m30,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
   xlabel('time [s]')
   ylabel('trials')
   title('-30°')
   set(gca,'FontSize',fntSize)
   %grid on;grid minor;
   colormap(hot)
   h = colorbar;
ylabel(h, 'normalized amplitude')
   text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

   subplot(2,2,2)
   tmp=permute(neck_p30,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
   title('+30°')
   xlabel('time [s]')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
   %grid on;grid minor;
   %colormap(linearInferno())
   colormap(hot)
   h = colorbar;
ylabel(h, 'normalized amplitude')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

      subplot(2,2,3)
   tmp=permute(neck_m120,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
      title('-120°')
   xlabel('time [s]')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
   %grid on;grid minor;
   %colormap(linearInferno())
   colormap(hot)
  caxis([-1,1])
   h = colorbar;
ylabel(h, 'normalized amplitude')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

   subplot(2,2,4)
   tmp=permute(neck_p120,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
      title('+120°')
   xlabel('time [s]')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
   %grid on;grid minor;
      %colormap(linearInferno())
      colormap(hot)
   h = colorbar;
ylabel(h, 'normalized amplitude')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

%%

   figure
   st=suptitle('Horizontal EOG');
   st.FontSize=fntSize+10;
   subplot(2,2,1)
   tmp=permute(eog_m30,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
   xlabel('time [s]')
   title('-30°')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
h = colorbar;
ylabel(h, 'angle [degree]')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')
   %colormap(linearInferno())
   colormap(hot)
   caxis([-50,50])
   
   subplot(2,2,2)
   tmp=permute(eog_p30,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
   title('+30°')
   xlabel('time [s]')
   set(gca,'FontSize',fntSize)
h = colorbar;
ylabel(h, 'angle [degree]')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

   %colormap(linearInferno())
   colormap(hot)
caxis([-50,50])
      subplot(2,2,3)
   tmp=permute(eog_m120,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
      title('-120°')
   xlabel('time [s]')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
h = colorbar;
ylabel(h, 'angle [degree]')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')

   %colormap(linearInferno())
   colormap(hot)
caxis([-50,50])
   subplot(2,2,4)
   tmp=permute(eog_p120,[3,2,1]);
   tmp2=reshape(tmp,size(tmp,1),[])';
   imagesc(timevec,1:nTrials,tmp2);
      title('+120°')
   xlabel('time [s]')
   ylabel('trials')
   set(gca,'FontSize',fntSize)
      %colormap(linearInferno())
      colormap(hot)
caxis([-50,50])
h = colorbar;
ylabel(h, 'angle [degree]')
text(9.9,-15,'\downarrow post-stimulus epoch','FontSize',fntSize,'FontWeight','bold')
