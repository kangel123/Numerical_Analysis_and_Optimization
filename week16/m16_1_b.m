clc;clear;

x0=[5 1];
for k=1:1
    gf=fnc_grdf(x0);
    sk = fnc_linsolve(fnc_H,-gf);
    x=x0+sk; 
end

function gf=fnc_grdf(x)
gf=[x(1) 5*x(2)];
end

function H=fnc_H
H=[1 0;0 5];
end

function x=fnc_linsolve(A,b)
x=b/A;
end