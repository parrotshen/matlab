% Plot signal waveform and spectrum.
% sound_plot(sig, fs)
%
function sound_plot(sig, fs)

L = length(sig);
F = fft(sig, L);
t = (0:L-1)/fs;
f = (0:L/2-1)*fs/L;
figure;
subplot(2, 1, 1);
plot(t, sig);
title('Signal Waveform (sec)');
subplot(2, 1, 2);
plot(f, abs(F(1:L/2)));
title('Signal Spectrum (Hz)');
grid on;

end
