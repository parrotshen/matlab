clear all;
close all;

filename = 'speak10s.wav';
[sig, fs] = audioread(filename);
y = sig(:, 1);
lsam = length(y);
scale = max(abs(y));
y = y/scale;
z = zeros(lsam, 1);


lfrm = 512;   % frame size
gain = 0.8;   % gain
fshift = 300; % right shift Hz
wshift = round(fshift*lfrm/fs);
if (wshift == 0)
    wshift = 1;
end
if (wshift > (lfrm-1))
    wshift = (lfrm-1);
end
fprintf('Right shift %d Hz\n', fshift);


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
        X = [zeros(wshift, 1); ...
             W(1:(lfrm/2)-wshift); ...
             W((lfrm/2)+1+wshift:lfrm); ...
             zeros(wshift, 1)];
        frame = ifft(X, lfrm);
        z(ii:jj) = z(ii:jj)+(real(frame)./window).*triangle;
    end
end


sound_plot(y, fs);
sound_plot(z, fs);

sound(gain*scale*z, fs);
