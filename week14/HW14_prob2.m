clear;clc;
[A,b,x]=fnc_init();

[x1, k1]=fnc_Jacobi(A,b, x);
[A,b,x]=fnc_init();
[x2, k2]=fnc_Gauss_Seidel(A,b, x);
k1
k2

function [A,b,x]=fnc_init()
    A=zeros(501,501);
    [n,m]=size(A);
    for i = 1 : n
        for j = 1:m
            if i-j==0
                A(i,j)=4;
            end
            if abs(i-j)==1;
                A(i,j)=-1;
            end
             if abs(i-j)==3;
                A(i,j)=-1;
            end
        end
    end
    b= zeros(501,1);
    b(501,1)=1;
    x= zeros(501,1);
end

function [x, k]=fnc_Jacobi(A,b, x)
    k=0;
    tol = 1e-6; err=tol+1;
    n = length(b);
    while err > tol
        xold = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma+A(i,j)*x(j);
                end
            end
            x(i) = (b(i)-sigma)/A(i,i);
        end
        err = abs(xold-x);
        k=k+1;
    end
end

function [x, k]=fnc_Gauss_Seidel(A, b, x)    
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
end