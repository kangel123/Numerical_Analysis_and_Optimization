clc; clear;
%% 
A = input('A = ');
n = length(A);
b = input('b = ');
x = zeros(n,1);
%% Gauss elimination
% MA(=U), Mb

for k = 1:(n-1)
   
    if A(k,k) == 0
        break;
    end
    
    M_{k}=eye(n); 
    for i = k+1: n
        M_{k}(i,k) = -A(i,k)/A(k,k);
    end
    A=M_{k}*A;
    b=M_{k}*b;
end
% x
for j = n:-1:1
    if A(j,j) == 0
        break;
    end
    x(j,1) = b(j,1)/A(j,j);
    for i=1:(j-1)
        b(i,1)=b(i,1)-A(i,j)*x(j,1);
    end        
end
