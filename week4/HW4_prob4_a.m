clc;clear
A = [1 -1 -1;-1 3 -1;-1 -1 5];
n = length(A);
b = [-5;3;11];
x = zeros(n,1);
%% Gauss-Jordan Elimination
for k = 1:n
    if A(k,k) == 0
        break;
    end
    M_{k}=eye(n); 
    for i = 1:k-1
        M_{k}(i,k) = -A(i,k)/A(k,k);
    end
    for i = k+1: n
        M_{k}(i,k) = -A(i,k)/A(k,k);
    end
    A=M_{k}*A;
    b=M_{k}*b;
end
A
b
%% x
for k =1:n
    if A(k,k)==0
        break;
    end
    x(k,1)=b(k,1)/A(k,k);
end
x