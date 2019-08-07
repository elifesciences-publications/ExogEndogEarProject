function output= exp4_buffer_artfilt_average_mra(input,nbuffer,nstd)
% Dependencies:
%   artfilt_std.m

%% Performs artefact filtering (+-nstd / n standard deviations)
%% based on the mean squared values (~energy) of non-overlapping
%% segments of length nbuffer
%% --> for every subband independently

output=zeros(size(input,1),1); 

for k = 1:size(input,1) % k = subband
tmp=input(k,:).^2; % square each value within the subband
tmp=mean(buffer(tmp,nbuffer)); % mean of buffered squared signal is proportional it's energy (*nbuffer) 
tmp(end)=[]; % remove last segment (zero-padded)

[inrange,~] = artfilt_std(tmp,nstd); % only return segments within +- n standard deviations (nstd)
output(k)=mean(inrange);  
    if(((numel(inrange)/numel(tmp))<.95) && (k==1))
    fprintf('%.2f\n',numel(inrange)/numel(tmp)) % print high rejection rates (>5%) during the first subband
    end
end

end