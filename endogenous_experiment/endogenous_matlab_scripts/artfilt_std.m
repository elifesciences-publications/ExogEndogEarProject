function [inrange,outrange] = artfilt_std(input,n)
%% removes samples outside of +- n std

%% for any distribution, at least ~75% should be within 2 std
%% and ~95% if normally distributed

tfact=[mean(input)-n*std(input),mean(input)+n*std(input)];
vec=(input>tfact(1))&(input<tfact(2));
inrange=input(vec);
outrange=input(~vec);
end