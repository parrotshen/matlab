% Write complex number sequence to 16-bit integer format file.
% cplx_write_file_int16(cplx, filename)
%
% Input:
%   cplx = Complex number sequence
%   filename = Output file name (.bin)
function cplx_write_file_int16(cplx, filename)

% Convert the amplitude to +16384 ~ -16384
scale = 16384 / max([max(abs(real(cplx))) max(abs(imag(cplx)))]);
cplx = cplx * scale;

% Combine real and imaginary into a 32 bits data array
r16 = double( typecast(int16(round(real(cplx))), 'uint16') );
i16 = double( typecast(int16(round(imag(cplx))), 'uint16') );
data = r16 + (65536 * i16);

% size of complex number is (2-byte x 2)
fid = fopen(filename, 'w');
fwrite(fid, data, 'uint32');
fclose(fid);

end
