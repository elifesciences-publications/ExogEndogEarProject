function output= exp4_buffer_artfilt_average(input,nbuffer,nstd)
% Dependencies:
%   artfilt_std.m

%% Performs artefact filtering (+-nstd / n standard deviations)
%% based on the mean squared values (~energy) of non-overlapping
%% segments of length nbuffer

input=mean(buffer(input.^2,nbuffer)); % mean values of buffered squared signal (proportional to energy)
input(end)=[]; % remove last segment (zero-padded)

[inrange,~] = artfilt_std(input,nstd); % only return segments within +- n standard deviations (nstd)

output=mean(inrange);
if((numel(inrange)/numel(input))<.95)
fprintf('%.2f\n',numel(inrange)/numel(input)) % print high rejection rates (>5%)
end
end