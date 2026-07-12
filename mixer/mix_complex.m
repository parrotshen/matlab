close all;
clear;
clc;

% 100 samples (1 sec)
fs = 100;
dt = 1/fs;
N  = fs;
t  = 0:dt:(N-1)*dt;

% mix fA with fB
fA = 3;  % 3Hz
fB = 10; % 10Hz
waveA = exp(1i*2*pi*fA*t);
waveB = exp(1i*2*pi*fB*t);
waveC = waveA .* waveB;

% time domain
figure;
plot(t, real(waveA), 'b');
hold on;
plot(t, real(waveB), 'g');
hold on;
plot(t, real(waveC), 'r');
grid on;
title(['Mix ',num2str(fA),'Hz with ',num2str(fB),'Hz']);
xlabel('Time (sec)');
ylabel('Amplitude');


dftA = fft(waveA);
dftB = fft(waveB);
dftC = fft(waveC);
dftA_shift = fftshift(dftA);
dftB_shift = fftshift(dftB);
dftC_shift = fftshift(dftC);

% frequency domain (-fs/2 ~ fs/2)
f = fs*[-N/2:N/2-1]/N;
figure;
stem(f, abs(dftA_shift), 'b');
hold on;
stem(f, abs(dftB_shift), 'g');
hold on;
stem(f, abs(dftC_shift), 'r');
grid on;
title('DFT (-fs/s ~ fs/2)');
xlabel('Frequency (Hz)');
ylabel('|DFT value|');
