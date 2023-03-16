 clearvars; clc; close all;

v1=[0.0; 0.0]; v2=[1.2;0.0]; v3=[0.0;0.8];
v=[v1 v2 v3];
f1=fnc_f(v1); f2= fnc_f(v2); f3= fnc_f(v3);
for k=1:10
    f=[f1 f2 f3];
    [g,ind]=sort(f,'descend');
    w=v(:,ind);

    v4= fnc_original(w);
    v =[w(:,2) w(:,3) v4];
    f1=fnc_f(v(:,1));
    f2=fnc_f(v(:,2));
    f3=fnc_f(v(:,3));
end
disp(v4)


function f=fnc_f(v)
x=v(1); y=v(2);
f=2*x^2+5*y^2;
end

function q=fnc_original(w)
p1=w(:,2); p2=w(:,3);
q=[mean([p1(1),p2(1)]) ; mean([p1(2),p2(2)])] ;
end
