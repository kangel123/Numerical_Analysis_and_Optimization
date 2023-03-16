clc;clear
A = [1 -1 -1;-1 3 -1;-1 -1 5];
n = length(A);
b = [-5;3;11];
x = zeros(n,1);
%% Cholesky factorization
for k=1:n
    A(k,k)=sqrt(A(k,k));
    for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
    end
    for j=k+1:n
        for i=j:n
            A(i,j)=A(i,j)-A(i,k)*A(j,k);
        end
    end
end
L=tril(A); %하부만 가져온다.
L
%% x
U=L.';
M=inv(L);
b=M*b;

%Ux=Mb
for j = n:-1:1
    if U(j,j) == 0
        break;
    end
    x(j,1) = b(j,1)/U(j,j);
    for i=1:(j-1)
M1 = [1 0 0;
    -U(2,1)/U(1,1) 1 0;
    -U(3,1)/U(1,1) 0 1];
        b(i,1)=b(i,1)-U(i,j)*x(j,1);
    end        
end
x

