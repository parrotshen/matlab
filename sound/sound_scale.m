clear all;
close all;

fs = 44100;  % sample rate
t = 0:1/fs:0.5;

% pitch = 69 + 12 x log2(freq / 440)
%    DO RE MI FA SO LA TI
p = [60 62 64 65 67 69 71];
f = 440*power(2, (p-69)/12);
DO = sin(2*pi*f(1)*t);
RE = sin(2*pi*f(2)*t);
MI = sin(2*pi*f(3)*t);
FA = sin(2*pi*f(4)*t);
SO = sin(2*pi*f(5)*t);
LA = sin(2*pi*f(6)*t);
TI = sin(2*pi*f(7)*t);
Cscale = [DO, RE, MI, FA, SO, LA, TI];

plot(Cscale);
sound(Cscale, fs);
