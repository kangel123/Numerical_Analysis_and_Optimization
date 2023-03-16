%%
clc; clearvars; close all;
%%
tol=1e-6;
err=tol+1;
iterN=0;
maxN=100;
xold=[0 3 0];
%%
while err > tol && iterN < maxN
    iterN = iterN+1; % update iteration number
    xnew = fnc_g(xold); % apply fixed point iteration
    err = norm(xold-xnew); % compute error
    xold=xnew; % update x
end

display(xnew)
%%
function y = fnc_g(x)
y = [
-cos(x(1))/81+(x(2)*x(2))/9+sin(x(3))/3;
sin(x(1))/3+cos(x(3))/3;
-cos(x(1))/9+x(2)/3+sin(x(3))/6];
end