close all;
clear all;

A  = [1 0 0 0 0 1 0 0 1 0];
C1 = [1 0 0 1 0 0 1 1 1 1];
C2 = [1 0 0 1 0 1 1 0 1 1];

M1 = Mfun(A, C1);
M2 = Mfun(A, C2);

x = 1:size(M1)(2);
subplot(3, 1, 1);
grid on;
plot(x, M1)
subplot(3, 1, 2);
grid on;
plot(x, M2)

shift = 100 + 18*10;
M = [M1 zeros(1, shift)] - [zeros(1, shift) M2];
subplot(3, 1, 3);
grid on
x = 1:size(M)(2);
plot(x, M);