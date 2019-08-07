
function [triggerOnsets, triggerOffsets,trigger] = triggerDetection2(trigger, samplingRate,offset)

    % Applying mean value thresholding

    threshold = (max(trigger) - min(trigger))/2;
    trigger = 1*(trigger > threshold);
    
    % Detecting trigger onsets and offsets
    triggerOnsets = find(diff(trigger) == 1) ;
    triggerOffsets = find(diff(trigger) == -1);
    if isempty(triggerOffsets)
       triggerOffsets=numel(trigger); 
        sprintf('-No Trigger Offset Found-\n')
    end
    
    % Shorten trigger by offset
    ntriggers = numel(triggerOnsets);
    for k = 1:ntriggers
        trigger(triggerOffsets(k)-offset+1:triggerOffsets(k))=0;
    end
    triggerOffsets = find(diff(trigger) == -1);
    
end