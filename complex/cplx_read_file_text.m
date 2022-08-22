% Read complex number sequence from string format file.
% [cplx] = cplx_read_file_text(filename)
%
% Input:
%   filename = Input file name (.txt)
%
% Output:
%   cplx = Complex number sequence
function [cplx] = cplx_read_file_text(filename)

fid = fopen(filename, 'r');
data = fscanf(fid, '%f %f', [2 inf]);
fclose(fid);

cplx = data(1,:) + 1i*data(2,:);
cplx = cplx.';

end
