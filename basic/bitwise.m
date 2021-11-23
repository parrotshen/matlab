clear all;
clc;

a = 103;  % 67h = 01100111b
b = 60;   % 3Ch = 00111100b
fprintf(1, 'a = %3d = 0x%02x\n', a, a);
fprintf(1, 'b = %3d = 0x%02x\n\n', b, b);

fprintf(1, 'bitand:\n');
fprintf(1, '(0x%02x & 0x%02x) = 0x%02x\n\n', a, b, bitand(a, b));

fprintf(1, 'bitor:\n');
fprintf(1, '(0x%02x | 0x%02x) = 0x%02x\n\n', a, b, bitor(a, b));

fprintf(1, 'binxor:\n');
fprintf(1, '(0x%02x ^ 0x%02x) = 0x%02x\n\n', a, b, bitxor(a, b));

fprintf(1, 'bitget:\n');
fprintf(1, 'a[4:1] = %d %d %d %d\n', fliplr( bitget(a, 1:4) ));
fprintf(1, 'b[8:5] = %d %d %d %d\n\n', fliplr( bitget(b, 5:8) ));

fprintf(1, 'bitset:\n');
fprintf(1, 'a[4] = 1, a = %02x\n', bitset(a, 4, 1));
fprintf(1, 'a[3] = 0, a = %02x\n', bitset(a, 3, 0));
fprintf(1, 'a[2] = 1, a = %02x\n', bitset(a, 2, 1));
fprintf(1, 'a[1] = 0, a = %02x\n\n', bitset(a, 1, 0));

fprintf(1, 'bitcmp:\n');
fprintf(1, 'complement( a ) = 0x%02x\n', bitcmp(a, 8));
fprintf(1, 'complement( b ) = 0x%02x\n\n', bitcmp(b, 8));

fprintf(1, 'bitshift:\n');
fprintf(1, 'a >> 4 = 0x%x\n', bitshift(a, -4));
fprintf(1, 'a << 4 = 0x%03x\n\n', bitshift(a,  4));

