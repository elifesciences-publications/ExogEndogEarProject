function [segmentedSignal,validSegments]= exp4_buffer_artfilt_valid_segments_MRA(input,nbuffer,n)
% Dependencies:
%   exp4_buffer_artfilt_valid_segments

%% Segments the signal into segments of nbuffer length,
%% calculates their mean energy and estimates which segments
%% contain artefacts based on n standard deviations.
%% 'segmentedSignal' containts the segments with the mean energy and
%% 'validSegments' is a logical vector indicating which segments
%% are within +- n standard deviations


nSubbands=size(input,1);

for subband = 1:nSubbands
   [segmentedSignal(subband,:),validSegments(subband,:)]= exp4_buffer_artfilt_valid_segments(input(subband,:),nbuffer,n) ;
end

end