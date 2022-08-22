% Write complex number sequence to double format file.
% cplx_write_file_double(cplx, filename)
%
% Input:
%   cplx = Complex number sequence
%   filename = Output file name (.raw)
function cplx_write_file_double(cplx, filename)

data = zeros(length(cplx)*2, 1);
data(1:2:end) = real(cplx);
data(2:2:end) = imag(cplx);

% size of complex number is (8-byte x 2)
fid = fopen(filename, 'w');
fwrite(fid, data, 'double');
fclose(fid);

end
