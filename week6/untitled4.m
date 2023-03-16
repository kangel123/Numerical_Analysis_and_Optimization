clc; clearvars; close all;

c = [1 0 -9];
x = roots(c);
xvec = linspace(0,4,501)
yvec = polyval(c, xvec);
figure; plot(xvec,yvec)