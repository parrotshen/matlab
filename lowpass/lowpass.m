clc;
clear;
close all;

txtFlag = 0;

%
%    W = 2*pi*F
%
% x(t) = A*cos(W*t + P)
%      = A*cos(2*pi*F*t + P)
%
fs = 48000;        % sampling frequency (Hz) 
dt = 1/fs;         % seconds per sample 
N = 256;           % number of samples
t = 0:dt:(N-1)*dt; % timeline

disp(['sampling frequency: ',num2str(fs),' Hz']);
disp(['timeline: ',num2str(N*dt),' sec']);
disp([num2str(N),' points']);
disp(' ');


A1 = 1;            % Sine wave A: amplitude
P1 = 0;            % Sine wave A: phase
F1 = 1000;         % Sine wave A: frequency (Hz) 
waveA = A1*cos(2*pi*F1*t + P1);

A2 = 0.5;          % Sine wave B: amplitude
P2 = 0;            % Sine wave B: phase
F2 = 15000;        % Sine wave B: frequency (hertz) 
waveB = A2*cos(2*pi*F2*t + P2);

disp(['wave A: ',num2str(F1),'Hz, ',num2str(N*dt*F1),' cycles']);
disp(['wave B: ',num2str(F2),'Hz, ',num2str(N*dt*F2),' cycles']);


% sine wave A, B, A+B
figure;
plot(t, waveA, 'b');
hold on;
plot(t, waveB, 'r');
grid on;
title('1. Sine wave A, B');
xlabel('Time (sec)');
ylabel('Amplitude');
legend(['A:',num2str(F1),'Hz'],['B:',num2str(F2),'Hz']);

waveAB = waveA + waveB;
if ( txtFlag )
    fid = fopen('waveAB.txt', 'w');
    fprintf(fid, '%f\n', waveAB);
    fclose(fid);
end

figure;
plot(t, waveAB);
grid on;
title('2. Sine wave (A+B)');
xlabel('Time (sec)');
ylabel('Amplitude');


%
% cos(k) = (exp(i*k) + exp(-i*k))/2
%
%   x(t) = A*cos(W*t + P)
%        = A/2 * exp(i*(W*t + P)) + A/2 * exp(-i*(W*t + P))
%
dftAB = fft(waveAB);
dftAB_shift = fftshift(dftAB);
if ( txtFlag )
    fid = fopen('dftAB_abs.txt', 'w');
    fprintf(fid, '%f\n', abs(dftAB));
    fclose(fid);
end

% FFT (-fs/2 ~ fs/2)
f = fs*[-N/2:N/2-1]/N;
figure;
plot(f, abs(dftAB_shift));
grid on;
title('3. DFT (-fs/s ~ fs/2)');
xlabel('Frequency (Hz)');
ylabel('|DFT value|');

% FFT (0 ~ fs/2)
f = fs*[0:N/2]/N;
figure;
plot(f, abs(dftAB_shift(round(N/2):N)));
grid on;
title('4. DFT (0 ~ fs/2)');
xlabel('Frequency (Hz)');
ylabel('|DFT value|');


% low pass filter
coeff = fir1(28, 6/24);
if ( txtFlag )
    fid = fopen('coeff.txt', 'w');
    fprintf(fid, '%f\n', coeff);
    fclose(fid);
end

figure;
stem(coeff);
grid on;
title('5. Low-pass filter');

[h,w] = freqz(coeff, 1, 512);
figure;
plot(w/pi*fs/2, abs(h));
grid on;
title('6. Frequency response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


waveAB_filter = conv(coeff, waveAB);
if ( txtFlag )
    fid = fopen('waveAB_filter.txt', 'w');
    fprintf(fid, '%f\n', waveAB_filter(1:N));
    fclose(fid);
end

figure;
plot(t, waveAB_filter(1:N));
grid on;
title('7. Sine wave (A+B) after low-pass filter');
xlabel('Time (sec)');
ylabel('Amplitude');
