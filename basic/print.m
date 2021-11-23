clear all;
clc;

% exponential table
x = 0:0.1:1;
table = [x; exp(x)];

fprintf(1, '%6s %12s\n', 'x', 'exp(x)');
fprintf(1, '%6.2f %12.8f\n', table);

fid = fopen('exp.txt', 'w');
fprintf(fid, '%6.2f %12.8f\r\n', table);
fclose(fid);
