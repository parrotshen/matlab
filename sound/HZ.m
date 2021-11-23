% HZ.m - Generate sound by the specific frequency (Hz).
% function HZ(freq)
%
function HZ(freq)

fs = 44100;  % sample rate
t = 0:1/fs:1;
w = sin(2*pi*freq*t);

sound(w, fs);
