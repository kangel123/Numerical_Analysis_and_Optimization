clc;clear;

x0=[5 1];
xold=x0;

for k=1:10
    s=fnc_g(xold);
    xnew=xold+s;
    xnew=xold;
end

function s=fnc_g(x)
    H=[1 0;0 5];
    g=[-x(1,1); -5*x(1,2)];
    s=H*g;
end