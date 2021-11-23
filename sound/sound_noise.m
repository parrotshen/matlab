clear all;
close all;

N = 8192;
x = rand(1, N);

plot(x);
sound(x, 8192);  % sample rate 8192
