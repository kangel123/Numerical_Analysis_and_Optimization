clc; clear;

x=-2;
for k=1:10
    x=fnc_g(x)
end


function xk=fnc_g(x)
 xk = x-(5*exp(-x^2)-10*(x^2)*exp(-x^2)+x)/(-10*x*exp(-x^2)-20*x*exp(-x^2)+20*(x^3)*exp(-x^2)+1);
end