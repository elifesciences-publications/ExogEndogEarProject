function [signal_struct] = exp4_cut_story(signal,trigger)
% Dependencies
%   triggerDetection2.m
signal_struct=struct;

     [triggerOnsets, ~,~] = triggerDetection2(trigger, 1,0);
     %3 -> silence
     %4 -> intro
     %5 -> start listening
     %6 ->end listening 
      
     %% active listening task: between 5. and 6. trigger onset
    %% except for some subjects where corrupted trigger signals were recorded
     
      if (numel(triggerOnsets) >= 8)  % this is the default case
     story_indx=triggerOnsets(5):triggerOnsets(6);
 
      elseif (numel(triggerOnsets) == 2)||(numel(triggerOnsets) == 3) % exception for corrupted trigger signals
      story_indx=triggerOnsets(5):triggerOnsets(6);(triggerOnsets(1):triggerOnsets(2));       
      fprintf('\n- - -2 or 3 Trigger points - - -\n')
  
      else
     fprintf('\n- - - Trigger Onsets !=8 - - -\n')

      end

 signal_struct.signal_story=signal(story_indx);

 
end