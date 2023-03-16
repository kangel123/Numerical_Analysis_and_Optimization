clearvars; clc;
x=1;
tol=1e-6; ErrorValue=tol+1;
disp(' x y dy/dx h');
while ErrorValue > tol
    % compute function values
    [y,yp]=fnc_newton_f(x);
    % Newton update
    newx=x-y/yp;
    % show results
    fprintf(' %1.6f %1.6f %1.6f %1.6f\n',x,y,yp,y/yp);
    % compute error
    ErrorValue=abs(newx-x);
    % update x
    x=newx;
end

function [y,yp]=fnc_newton_f(x)
y=x^5-x^3-4*x;
yp=5*x^4-3*x^2-4;
end