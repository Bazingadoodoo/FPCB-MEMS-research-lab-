clc 
clear all

f = 30;             % Hz
n = 4;              % division in segments
t = 11e-6;           % program runtime
p = 4*n+1;          % number of points

%% function generator

T = 1/f;                % function period
disp(['functin period is ',num2str(T),' seconds'])

%% Arduino program

delay = (T-(p*t))/p;    % delay time arduino programs loop
disp(['arduino delay is ',num2str(delay),' seconds'])