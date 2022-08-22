% Read complex number sequence from double format file.
% [cplx] = cplx_read_file_double(filename)
%
% Input:
%   filename = Input file name (.raw)
%
% Output:
%   cplx = Complex number sequence
function [cplx] = cplx_read_file_double(filename)

fid = fopen(filename, 'r');
data = fread(fid, 'double');
fclose(fid);

cplx = data(1:2:end) + data(2:2:end)*i;

end
