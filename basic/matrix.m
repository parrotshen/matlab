clear all;
clc;

%     / 1  2 \
% M = |      |
%     \ 3  4 /
M = [ 1 2; 3 4 ]

% transpose of M
%   1  2  =>  1  3
%   3  4      2  4
disp('M''');
M'

% transform to a vector (column-wise)
disp('M(:)');
M(:)


%     / 5 \
% V = |   |
%     \ 6 /
V = [ 5; 6 ]

% matrix-vector product
%   M*V = 1*5 + 2*6
%       = 3*5 + 4*6
disp('M*V');
M*V

% vector product
%   V*V' = 5 * [5 6] = 5*5  5*6
%          6           6*5  6*6
disp('V*V''');
V*V'

% vector inner product
%   V.*V = 5*5
%          6*6
disp('V.*V');
V.*V
