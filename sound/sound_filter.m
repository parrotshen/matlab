clear all;
close all;

filename = 'speak10s.wav';
[sig, fs] = audioread(filename);
y = sig(:, 1);
lsam = length(y);
scale = max(abs(y));
y = y/scale;
z = zeros(lsam, 1);


lfrm = 512;  % frame size
gain = 0.5;  % gain
fbegin = 80; % filter begin Hz
fend = 600;  % filter end Hz
wbegin = round(fbegin*lfrm/fs);
if (wbegin == 0)
    wbegin = 1;
end
wend = round(fend*lfrm/fs);
if (wend > lfrm)
    wend = lfrm;
end
fprintf('Remove %d-%d Hz\n', fbegin, fend);


% Hamming window
window = zeros(lfrm, 1);
for ii=0:lfrm-1
    window(ii+1) = 0.54-0.46*cos(ii*2*pi/(lfrm-1));
end

% Triangular window
triangle = zeros(lfrm, 1);
for ii=0:(lfrm/2)-1
    triangle(ii+1) = ii/(lfrm/2);
    triangle(lfrm-ii) = triangle(ii+1);
end

% overlap 50% frame
for ii=1:(lfrm/2):lsam
    jj = (ii+lfrm-1);
    if (jj <= lsam)
        frame = y(ii:jj);
        frame = frame.*window;
        W = fft(frame, lfrm);
        W(wbegin:wend) = 0;
        W(lfrm-wend+1:lfrm-wbegin+1) = 0;
        frame = ifft(W, lfrm);
        z(ii:jj) = z(ii:jj)+(real(frame)./window).*triangle;
    end
end


sound_plot(y, fs);
sound_plot(z, fs);

sound(gain*scale*z, fs);
