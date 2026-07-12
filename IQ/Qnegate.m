close all;
clear;
clc;

IQ;

% Waveform
figure;
plot(t, real(waveA), 'b');
hold on;
plot(t, imag(waveA), 'r');
grid on;
title('Waveform: original');
xlabel('Time (sec)');
ylabel('Amplitude');

% Spectrum
figure;
stem(f, real(dftA_shift), 'b');
hold on
stem(f, imag(dftA_shift), 'r');
grid on;
title('Spectrum: original');
xlabel('Frequency (Hz)');
ylabel('|DFT value|');


% Q => -Q
waveB = real(waveA) - imag(waveA)*1i;
figure;
plot(t, real(waveB), 'b');
hold on;
plot(t, imag(waveB), 'r');
grid on;
title('Waveform: negative Q');
xlabel('Time (sec)');
ylabel('Amplitude');

dftB = fft(waveB);
dftB_shift = fftshift(dftB);
figure;
stem(f, real(dftB_shift), 'b');
hold on
stem(f, imag(dftB_shift), 'r');
grid on;
title('Spectrum: negative Q');
xlabel('Frequency (Hz)');
ylabel('|DFT value|');
