% Generate sound by the specific frequency (Hz).
% HZ(freq)
%
function HZ(freq)

fs = 44100;  % sample rate
t = 0:1/fs:1;
w = sin(2*pi*freq*t);

sound(w, fs);

end
