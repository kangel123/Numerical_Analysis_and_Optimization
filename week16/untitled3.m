clear;clc;
A = [5 -1 2;2 5 -1;3 1 7];
b= [1;13;-2];
x= randn(3,1); %[1;1;1];

D=diag(diag(A));
L=tril(A,-1);
U=triu(A, +1);
omega=1; S=D+omega*L;

tol = 1e-6; err=tol+1;
while err > tol
    xold = x;
    x = S\(((1-omega)*D + omega*U)*x) + omega*(S\b);
    err = norm(xold-x);
end
