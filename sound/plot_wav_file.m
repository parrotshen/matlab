% Plot and play audio file (.wav).
% plot_wav_file(filename)
%
function plot_wav_file(filename)

[y, fs] = audioread(filename);
sound(y, fs);

samp = length(y);
time = (0:samp-1)/fs;
Y = fft(y, samp);
freq = (0:samp/2-1)*fs/samp;

figure;
subplot(2, 1, 1);
plot(time, y);
title('Waveform (sec)');
subplot(2, 1, 2);
plot(freq, abs(Y(1:samp/2)));
title('Spectrum (Hz)');

info = audioinfo(filename);
fprintf('Filename = %s\n', info.Filename);
fprintf('CompressionMethod = %s\n', info.CompressionMethod);
fprintf('NumChannels = %g\n', info.NumChannels);
fprintf('SampleRate = %g Hz\n', info.SampleRate);
fprintf('TotalSamples = %g\n', info.TotalSamples);
fprintf('Duration = %g sec\n', info.Duration);
fprintf('BitsPerSample = %g bit per sample\n', info.BitsPerSample);

end
