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

ccf = my_sf(M, M1);
x = 0:1:length(ccf)-1;
subplot(4, 2, 5);
plot(x, ccf);
title('my\_sf(M_s_u_m_m, M_1)');

ccf = my_sf(M, M2);
x = 0:1:length(ccf)-1;
subplot(4, 2, 7);
plot(x, ccf);
title('my\_sf(M_s_u_m_m, M_2)');

acf = xcorr(M1, M1);
x = 0:1:length(acf)-1;
subplot(4, 2, 2);
plot(x, acf);
title('xcorr(M_1, M_1)');

ccf = xcorr(M2, M1);
x = 0:1:length(acf)-1;
subplot(4, 2, 4);
plot(x, ccf);
title('xcorr(M_2, M_1)');

ccf = xcorr(M, M1);
x = 0:1:length(ccf)-1;
subplot(4, 2, 6);
plot(x, ccf);
title('xcorr(M_s_u_m_m, M_1)');

ccf = xcorr(M, M2);
x = 0:1:length(ccf)-1;
subplot(4, 2, 8);
plot(x, ccf);
title('xcorr(M_s_u_m_m, M_2)');

A_noise = 18;
noise = A_noise - 2*A_noise*rand(1, length(M1));
M3 = M1 + noise;

figure
subplot(3, 1, 1)
x = 0:1:length(M3) - 1;
plot(x, M3)
title('M_3');

subplot(3, 1, 2)
ccf = my_sf(M3, M1);
x = 0:1:length(ccf)-1;
plot(x, ccf)
title('my\_sf(M_3, M_1)')

subplot(3, 1, 3)
ccf = 20*log10(abs(ccf/max(ccf)));
plot(x, ccf)
title('my\_sf(M_3, M_1), dB')