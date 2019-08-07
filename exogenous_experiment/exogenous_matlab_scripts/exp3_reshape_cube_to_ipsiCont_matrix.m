function [ipsi,contra] = exp3_reshape_cube_to_ipsiCont_matrix(ipsi1,ipsi2,contra1,contra2)

[nStimuli,nSubjects,nSamples]=size(ipsi1);

ipsi=zeros(nSamples,nStimuli*nSubjects);
contra=zeros(nSamples,nStimuli*nSubjects);

ipsi1=permute(ipsi1,[3,2,1]);
ipsi2=permute(ipsi2,[3,2,1]);
contra1=permute(contra1,[3,2,1]);
contra2=permute(contra2,[3,2,1]);


ipsi(:)=(ipsi1(:)+ipsi2(:))/2;
contra(:)=(contra1(:)+contra2(:))/2;

ipsi=ipsi';
contra=contra';

%% Debugging/testing
% ipsi1=(aam_lc_m120);
% ipsi1=permute(ipsi1,[3,2,1]);
% template=zeros(nSamples,nStimuli*nSubjects);
% template(:)=ipsi1(:);
% template=template';
% m1=mean(template);
% m2=squeeze(mean(mean(aam_lc_m120)));

end


