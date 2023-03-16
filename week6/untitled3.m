%%
clc; clearvars; close all;
%%
tol=1e-6;
ErrorValue=tol+1;
x=[0 0 0];
%%
while ErrorValue > tol
    s=fnc_solve_linear(fnc_Df(x),-fnc_f(x));
    x=x+s;
    ErrorValue=norm(s);
end
%%
function y = fnc_f(x)
    y = fnc_g(x)-[x(1); x(2); x(3)];
end

function J = fnc_Df(x)
    J = fnc_Dg(x)-eye(3);
end

function y = fnc_solve_linear(A,x)
    y=A\x;
end

function fx = fnc_g(x)
    fx = [
    -cos(x(1))/81+(x(2)*x(2))/9+sin(x(3))/3;
    sin(x(1))/3+cos(x(3))/3;
    -cos(x(1))/9+x(2)/3+sin(x(3))/6];
end
