close all;
clear all;

A  = [1 0 0 0 0 1 0 0 1 0];
C1 = [1 0 0 1 0 0 1 1 1 1];
C2 = [1 0 0 1 0 1 1 0 1 1];

M1 = Mfun(A, C1);
M2 = Mfun(A, C2);

x = 0:size(M1)(2) - 1;
subplot(3, 1, 1);
plot(x, M1)
title('M_1');

subplot(3, 1, 2);
plot(x, M2)
title('M_2');

shift = 100 + 18*10;
M = [M1 zeros(1, shift)] - [zeros(1, shift) M2];
subplot(3, 1, 3);
x = 0:size(M)(2) - 1;
plot(x, M);
title('M_1 - ~M_2');

figure

acf = my_sf(M1, M1);
x = 0:1:length(acf)-1;
subplot(4, 2, 1);
plot(x, acf);
title('my\_sf(M_1, M_1)');

ccf = my_sf(M2, M1);
x = 0:1:length(acf)-1;
subplot(4, 2, 3);
plot(x, ccf);
title('my\_sf(M_2, M_1)');