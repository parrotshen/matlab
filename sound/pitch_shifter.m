% Shift the pitch of the .wav file by the specified number of semitones.
% pitch_shifter(filename, nsemi, gain)
%
function [z, fs] = pitch_shifter(filename, nsemi, gain)

[sig, fs] = audioread(filename);
y = sig(:, 1);
L = length(y);
t = 0:1/fs:(L-1)/fs;

z = shiftPitch(y, nsemi);

Y = fft(y, L);
Z = fft(z, L);
N = round(1000*L/fs);
F = (0:N-1)*fs/L;
[fz, iz] = max(abs(Z));
[fy, iy] = max(abs(Y));
delta = F(iz)-F(iy);
disp(['Shift: ', num2str(delta), ' Hz']);

figure;
stem(F, abs(Y(1:N)), 'b-');
hold on;
stem(F, abs(Z(1:N)), 'm-');
grid on;
title('Signal Spectrum (Hz)');
legend('original','shifted');

sound(gain*z, fs);

end
