function [segmentedSignal,validSegments]= exp4_buffer_artfilt_valid_segments(input,nbuffer,n)
%% Segments the signal into segments of nbuffer length,
%% calculates their mean energy and estimates which segments
%% contain artefacts based on n standard deviations.
%% 'segmentedSignal' containts the segments with the mean energy and
%% 'validSegments' is a logical vector indicating which segments
%% are within +- n standard deviations

input=mean(buffer(input.^2,nbuffer)); % calulate mean energy of segments
input(end)=[]; % remove last segment (zero-padded)

tfact=[mean(input)-n*std(input),mean(input)+n*std(input)];
validSegments=(input>tfact(1))&(input<tfact(2));
segmentedSignal=input;

end

