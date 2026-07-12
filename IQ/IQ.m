%
% Xn = 7*exp(-3*1i*2*pi*t) + ...
%      6*exp(-2*1i*2*pi*t) + ...
%      5*exp(-1*1i*2*pi*t) + ...
%      4*exp( 0*1i*2*pi*t) + ...
%      3*exp(+1*1i*2*pi*t) + ...
%      2*exp(+2*1i*2*pi*t) + ...
%      1*exp(+3*1i*2*pi*t);
%
% IQ: (FFT real part)
%                 |
%                 |  |
%                 |  |  |
%                 |  |  |  |
%                 |  |  |  |  |
%                 |  |  |  |  |  |
%                 |  |  |  |  |  |  |
% -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7
%
% Inegate: (FFT real part)
% -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7
%                 |  |  |  |  |  |  |
%                    |  |  |  |  |  |
%                       |  |  |  |  |
%                          |  |  |  |
%                             |  |  |
%                                |  |
%                                   |
%
% Qnegate: (FFT real part)
%                                   |
%                                |  |
%                             |  |  |
%                          |  |  |  |
%                       |  |  |  |  |
%                    |  |  |  |  |  |
%                 |  |  |  |  |  |  |
% -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7
%
% IQnegate: (FFT real part)
% -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7
%                 |  |  |  |  |  |  |
%                 |  |  |  |  |  |
%                 |  |  |  |  |
%                 |  |  |  |
%                 |  |  |
%                 |  |
%                 |
%
% IQswap: (FFT imaginary part)
%                                   |
%                                |  |
%                             |  |  |
%                          |  |  |  |
%                       |  |  |  |  |
%                    |  |  |  |  |  |
%                 |  |  |  |  |  |  |
% -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7
%

% 16 samples per one second
fs = 16;
dt = 1/fs;
N  = fs;
t  = (dt*[0:(N-1)])';
if mod(N,2) == 0
f  = (fs*[-N/2:N/2-1]/N)';
else
f  = (fs*[-(N-1)/2:(N-1)/2]/N)';
end

% frequency components: -3,-2,-1,1,2,3Hz
Xn = 7*exp(-3*1i*2*pi*t) + ...
     6*exp(-2*1i*2*pi*t) + ...
     5*exp(-1*1i*2*pi*t) + ...
     4*exp( 0*1i*2*pi*t) + ...
     3*exp( 1*1i*2*pi*t) + ...
     2*exp( 2*1i*2*pi*t) + ...
     1*exp( 3*1i*2*pi*t);

waveA = Xn;
dftA = fft(waveA);
dftA_shift = fftshift(dftA);
