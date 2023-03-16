clc;clear;

x0=[1 1];
for k=1:1
    gf=fnc_grdf(x0);
    sk = fnc_linsolve(fnc_H,-gf);
    x=x0+sk; 
end
x

function gf=fnc_grdf(x)
gf=[4*x(1) 10*x(2)];
end

function H=fnc_H
H=[4 0;0 10];
end

function x=fnc_linsolve(A,b)
x=b/A;
end