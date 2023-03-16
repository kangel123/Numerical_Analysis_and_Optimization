clc;clear;
A=[1 -2 4 -8 0 0 0 0;
    1 0 0 0 0 0 0 0;
    0 0 0 0 1 0 0 0;
    0 0 0 0 1 2 4 8;
    0 1 0 0 0 -1 0 0;
    0 0 2 0 0 0 -2 0;
    0 0 2 -12 0 0 0 0;
    0 0 0 0 0 0 2 12];
y=[0; 1; 1; 0; 0; 0; 0; 0];
t=inv(A)*y

x=linspace(-2,0);
f=fnc_f(x,t(1:4,:));
plot(x,f,'blue')
hold on

x=linspace(0,2);
f=fnc_f(x,t(5:8,:));
plot(x,f,'blue')
hold off

function b=fnc_f(a,t)
    b=t(1,1)+a*t(2,1)+(a.^2)*t(3,1)+(a.^3)*t(4,1);
end
