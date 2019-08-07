function[tmp_neck_p30,...
         tmp_neck_m30,...
         tmp_neck_p120,...
         tmp_neck_m120] = exp3_gen_data_helper_neck(subj,stimulusName,addSamples,buffertemplate)
     
     % this script normalizes responses from the same electrode+subject+stimulus
     % to different directions
tmp_neck_p30=buffertemplate;
tmp_neck_m30=buffertemplate;

tmp_neck_p120=buffertemplate;
tmp_neck_m120=buffertemplate;

tmpstr=sprintf('*time_stimulus*%s*.mat',stimulusName);
listing=dir(tmpstr);

if size(listing,1) ~=4
 fprintf('\n - - -\n Error: Number of stimulus files not equal to 4:  exp3_gen_data_helper, subj = %i \n - - - \n',subj)
 rand(2).*rand(4)    
end

for k = 1:size(listing,1)
    loadstr=listing(k).name;
   % fprintf('Loading: %s\n',loadstr)
    
   if     ~isempty(strfind(loadstr,'+30'))
        tmpstim_p30=load(loadstr);
        %% Remove 100 zeros at the end            
        tmpstim_p30.neck_time_during(:,end-100:end)=[];      
   elseif ~isempty(strfind(loadstr,'-30'))
        tmpstim_m30=load(loadstr);
        %% Remove 100 zeros at the end            
        tmpstim_m30.neck_time_during(:,end-100:end)=[];   
   elseif ~isempty(strfind(loadstr,'+120'))
        tmpstim_p120=load(loadstr);
        %% Remove 100 zeros at the end            
        tmpstim_p120.neck_time_during(:,end-100:end)=[];
   elseif ~isempty(strfind(loadstr,'-120'))
        tmpstim_m120=load(loadstr);
        %% Remove 100 zeros at the end            
        tmpstim_m120.neck_time_during(:,end-100:end)=[]; 
   else % Error
    fprintf('\n - - -\n Error: Stimulus direction not found:  exp3_gen_data_helper, subj = %i \n - - - \n',subj)
    rand(2).*rand(4)
   end
    
end
%% Left Channel
      tmp_l_p30=(envelope([tmpstim_p30.neck_time_before(subj,:),tmpstim_p30.neck_time_during(subj,:),tmpstim_p30.neck_time_after(subj,:)]',150,'rms')');
      tmp_l_baseline_p30=mean(tmp_l_p30(1:addSamples));
      tmp_l_p30=tmp_l_p30-tmp_l_baseline_p30;

      tmp_l_m30=(envelope([tmpstim_m30.neck_time_before(subj,:),tmpstim_m30.neck_time_during(subj,:),tmpstim_m30.neck_time_after(subj,:)]',150,'rms')');
      tmp_l_baseline_m30=mean(tmp_l_m30(1:addSamples));
      tmp_l_m30=tmp_l_m30-tmp_l_baseline_m30;
      
      tmp_l_p120=(envelope([tmpstim_p120.neck_time_before(subj,:),tmpstim_p120.neck_time_during(subj,:),tmpstim_p120.neck_time_after(subj,:)]',150,'rms')');
      tmp_l_baseline_p120=mean(tmp_l_p120(1:addSamples));
      tmp_l_p120=tmp_l_p120-tmp_l_baseline_p120;
      
      tmp_l_m120=(envelope([tmpstim_m120.neck_time_before(subj,:),tmpstim_m120.neck_time_during(subj,:),tmpstim_m120.neck_time_after(subj,:)]',150,'rms')');
      tmp_l_baseline_m120=mean(tmp_l_m120(1:addSamples));
      tmp_l_m120=tmp_l_m120-tmp_l_baseline_m120;

      maxval_l=max(abs([tmp_l_p30,tmp_l_m30,tmp_l_p120,tmp_l_m120]));
      tmp_l_p30=tmp_l_p30./maxval_l;
      tmp_l_m30=tmp_l_m30./maxval_l;       
      tmp_l_p120=tmp_l_p120./maxval_l;
      tmp_l_m120=tmp_l_m120./maxval_l;    
      

  

  tmp_neck_m120(1:length(tmp_l_m120)-addSamples)=tmp_l_m120(1:end-addSamples);
  tmp_neck_m120(end-addSamples+1:end)=tmp_l_m120(end-addSamples+1:end);
  
  tmp_neck_p120(1:length(tmp_l_p120)-addSamples)=tmp_l_p120(1:end-addSamples);
  tmp_neck_p120(end-addSamples+1:end)=tmp_l_p120(end-addSamples+1:end);
  
  tmp_neck_m30(1:length(tmp_l_m30)-addSamples)=tmp_l_m30(1:end-addSamples);
  tmp_neck_m30(end-addSamples+1:end)=tmp_l_m30(end-addSamples+1:end);
  
  tmp_neck_p30(1:length(tmp_l_p30)-addSamples)=tmp_l_p30(1:end-addSamples);
  tmp_neck_p30(end-addSamples+1:end)=tmp_l_p30(end-addSamples+1:end);
  
 
end   