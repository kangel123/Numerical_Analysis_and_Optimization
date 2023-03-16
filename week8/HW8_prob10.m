clearvars; clc;
count=0;
root=double.empty;
while count<100
    x0=8*rand-4;
    x1=8*rand-4;
    y0=fnc_f(x0);
    y1=fnc_f(x1);
    if (y0<0 & 0<y1) | (y0>0 & 0>y1)
        x=Bisection(x0,x1);
    else
        x=Secant(x0,x1);
    end
    count=count+1;
    root(1,count)=round(x);
end
root=unique(rmmissing(root))

function b=Bisection(a,b)
    tol=10.^-12;
    if a>b
        c=a;
        a=b;
        b=c;
    end
    while ((b-a) > tol)
        m = (a+b)/2;
        if sign(fnc_f(a)) == sign(fnc_f(m))
            a = m;
        else
            b = m;
        end
    end
end

function x2=Secant(x0,x1)
    tol=10.^-12; ErrorValue=tol+1;
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
end

function y=fnc_f(x)
    y=(x.^2-4)/(x.^2+4);
end