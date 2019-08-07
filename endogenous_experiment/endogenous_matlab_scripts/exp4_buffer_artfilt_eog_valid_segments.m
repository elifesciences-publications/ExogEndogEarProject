function [segmentedSignal,validSegments]= exp4_buffer_artfilt_eog_valid_segments(input,nbuffer,maxangle)
%% Segments the eog signal into segments of nbuffer length,
%% calculates their mean absolute value and flags segments
%% exceeding +-maxangle

input=mean(buffer(abs(input),nbuffer));
input(end)=[];

validSegments=(input>-maxangle)&(input<maxangle);
segmentedSignal=input;

end

