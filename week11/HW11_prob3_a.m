clc;clear;

a=-2;
b=0;
r=(5^0.5-1)/2;

x1=a+(1-r)*(b-a);
x2=a+r*(b-a);

f1=fnc_f(x1);
f2=fnc_f(x2);

tol=1e-6;
while (b-a)>tol
    if f1>f2
        a=x1;
        x1=x2;
        f1=f2;
        x2=a+r*(b-a);
        f2=fnc_f(x2);
    else
        b=x2;
        x2=x1;
        f2=f1;
        x1=a+(1-r)*(b-a);
        f1=fnc_f(x1);
    end
end
disp(x1)
disp(f1)

function f=fnc_f(x)
    f=5*x*exp(-x^2)+0.5*x^2;
end
