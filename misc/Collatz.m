% Collatz.m - Collatz conjecture, the 3n+1 problem.
% function [step] = Collatz(num)
%
function [step] = Collatz(num)

step = 0;
data = [num];
while num ~= 1
    step = step+1;
    if mod(num, 2) == 0
        num = num/2;
    else
        num = num*3+1;
    end
    data = [data num];
end
data
plot(data);

end
