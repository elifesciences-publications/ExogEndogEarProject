function  features = exp4_getFeaturesEMG(signal,trigger)
% Dependencies:
%   triggerDetection2.m

%% Performs multiresolution analysis (via maximal overlap discrete wavelet transform)
%% and returns only the parts of the signal during active listening

features = struct;

decompositionLevel = 7 ; % does not include approximation
wname='db3';
decomposition = modwt(signal,wname,decompositionLevel);

[triggerOnsets, ~,~] = triggerDetection2(trigger, 1,0);


%% active listening task: between 5. and 6. trigger onset
%% except for some subjects where corrupted trigger signals were recorded

      if (numel(triggerOnsets) >= 8) % this is the default case
        story_indx=triggerOnsets(5):triggerOnsets(6);
     
      elseif (numel(triggerOnsets) == 2)||(numel(triggerOnsets) == 3) % exception for corrupted trigger signals
        story_indx=triggerOnsets(1):triggerOnsets(2);

        fprintf('\n- - -2 or 3 Trigger points - - -\n')       
      else   % this should never happen                
        fprintf('\n- - - Trigger Onsets !=8 - - -\n')
      end
        features.story = decomposition(:,story_indx);

end