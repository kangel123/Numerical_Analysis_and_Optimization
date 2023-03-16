clear;clc;
A = [5 -1 2;2 5 -1;3 1 7];
b= [1;13;-2];
x= randn(3,1); %[1;1;1];
r=b-A*x;
s=r;
tol = 1e-6; err=tol+1;
n = length(b);
for k = 1:n
    a(k) = dot(r(:,k),r(:,k))/dot(s(:,k),A*s(:,k));
    x(:,k+1) = x(:,k) + a(k)*s(:,k);
    r(:,k+1) = r(:,k)-a(k)*A*s(:,k);
    b(k+1) = dot(r(:,k+1),r(:,k+1))/dot(r(:,k),r(:,k));
    s(:,k+1) = r(:,k+1) + b(k+1)*s(:,k);
end
