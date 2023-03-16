clc
clearvars
e=eps(1);
a=[1 1; e 0; 0 e];
b=[3;6;9];
m=a'*a;
[u, s, v]=svd(a);

x=(dot(u(:,1),b)/s(1,1))*v(:,1)

norm(a*x-b)
y=rand(2,1);
norm(a*y-b)