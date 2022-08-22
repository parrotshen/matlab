% Read complex number sequence from 16-bit integer format file.
% [cplx] = cplx_read_file_int16(filename)
%
% Input:
%   filename = Input file name (.bin)
%
% Output:
%   cplx = Complex number sequence
function [cplx] = cplx_read_file_int16(filename)

fid = fopen(filename, 'r');
data = fread(fid, 'int16');
fclose(fid);

cplx = data(1:2:end) + data(2:2:end)*i;

end
