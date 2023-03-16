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
    gf=[4*x(1) 10*x(2)];
end

function ak=fnc_falpha(x,a)
    x1=x(1); x2=x(2);
   for k=1:10
       bj=16*x1^2*(4*a-1)+100*x2^2*(10*a-1);
       bm=64*x1^2+1000*x2^2;
       a=a-bj/bm;
   end
   ak=a;
end