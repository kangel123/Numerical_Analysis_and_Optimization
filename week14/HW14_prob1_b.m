clc;clear;

x0=[5 1];
xold=x0;

for k=1:10
    sk=-fnc_gf(xold);
    ak= fnc_falpha(xold, 1);
    xnew=xold+ak*sk;
    xold=xnew;
end
xnew

function gf=fnc_gf(x)
    gf=[x(1) 5*x(2)];
end

function ak=fnc_falpha(x,a)
    x1=x(1); x2=x(2);
   for k=1:10
       bj=2*x1^2*(a-1)+50*x2^2*(5*a-1);
       bm=2*x1^2+250*x2^2;
       a=a-bj/bm;
   end
   ak=a;
end