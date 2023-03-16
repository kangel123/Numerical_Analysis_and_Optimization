clc; clear;
%% 
A = input('A = ');
n = length(A);
%% LU factorization


for k = 1:(n-1)
    if A(k,k) == 0
        break;
    end
    for i=(k+1):n
        M_{k}(i,k)=A(i,k)/A(k,k);
    end
    for j = (k+1):n
        for i = (k+1):n
            A(i,j) = A(i,j)-M_{k}(i,k).*A(k,j);
        end
    end
end
