clear all;
close all;

t = 0:1/200:1; % 1 sec (5 msec step)

f1 = 1; % Hz
wave1 = sin(2*pi*f1*t);
 
f2 = 10; % Hz
wave2 = cos(2*pi*f2*t);

plot(t, wave1, 'r-');
hold on;
plot(t, wave2, 'b-');
grid on;

xlabel('Time (sec)');
ylabel('Amplitude'); 
legend('wave1', 'wave2');
set(gca, 'ylim', [-2 2]);
