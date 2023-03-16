clear;clc;
A = [5 -1 2;2 5 -1;3 1 7];
b= [1;13;-2];
x= randn(3,1); %[1;1;1];
k=0;
tol = 1e-6; err=tol+1;
n = length(b);
while err > tol
    xold = x;
    for i = 1:n
        sigma = 0;
        for j = 1:i-1
            sigma = sigma+A(i,j)*x(j);
        end
        for j=i+1:n
            sigma = sigma+A(i,j)*xold(j);
        end
        x(i) = (b(i)-sigma)/A(i,i);
    end
    err = norm(xold-x);
    k=k+1;
end
disp(x)
