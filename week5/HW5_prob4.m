clearvars; clc;
x0=1;
x1=2;
tol=1e-6; ErrorValue=tol+1;
while ErrorValue > tol
% -- compute function values
y0=fnc_f(x0);
y1=fnc_f(x1);
% -- Secant update
x2=x1-y1*(x1-x0)/(y1-y0);
% -- compute error
ErrorValue=abs(x2-x1);
% -- update x
x0=x1;
x1=x2;
end
sol=x2

function yp=fnc_f(x)
yp= (x.^2-1)./(2*x)-cot(x);
end