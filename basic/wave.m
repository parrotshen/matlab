clear all;
close all;

t = 0:1/200:1;

f1 = 1;
wave1 = sin(2*pi*f1*t);
 
f2 = 10;
wave2 = cos(2*pi*f2*t);

plot(t, wave1, 'r--');
hold on;
plot(t, wave2, 'b-');
 
legend('wave1', 'wave2');
set(gca, 'ylim', [-2 2]);
