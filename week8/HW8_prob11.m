clearvars; clc;
x=2;
r=0;
tol=10.^-6; ErrorValue=tol+1;
while ErrorValue > tol
    % compute function values 
    [y,yp]=fnc_newton_f(x); 
    % Newton update
    newx=x-y/yp;
    % compute error   
    ErrorValue=abs(newx-x);
    r=r+y/yp;
    % update x
    x=newx;
end
fprintf('convergence rate of newton method : %d\n',r)

function [y,yp]=fnc_newton_f(x)
y=exp(x)-1;
yp=exp(x);
end

