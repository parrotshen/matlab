% Write complex number sequence to string format file.
% cplx_write_file_text(cplx, filename)
%
% Input:
%   cplx = Complex number sequence
%   filename = Output file name (.txt)
function cplx_write_file_text(cplx, filename)

fid = fopen(filename, 'w');
for n = 1:length(cplx)
    fprintf(fid, '%.16f\t%.16f\r\n', real(cplx(n)), imag(cplx(n)));
end
fclose(fid);

end
