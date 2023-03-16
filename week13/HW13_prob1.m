clearvars; close all; clc

A=[-1 1 0;-1 0 1;0 -1 1];
b=[711;1177;475];
x1=gs_fnc(A,b)
x2=h_func(A,b)
x3=svd_func(A,b)

% Gram-Suhmidt
function x=gs_fnc(A,b)
    [m,n]=size(A);
    R=zeros(n);
    for k=1:n
        Q(:,k)=A(:,k);
        for j=1:k-1
            R(j,k)=transpose(Q(:,j))*A(:,k);
            Q(:,k)=Q(:,k)-R(j,k)*Q(:,j);
        end
        R(k,k)=norm(Q(:,k),2);
        Q(:,k)=Q(:,k)/R(k,k);
    end
    Q
    R
    b=transpose(Q)*b
    x=bs(R,b)
end

% Householder QR Factorization
function x=h_func(A, b)
    [m, n]=size(A);
    I=eye(m);
    for k=1:n
        alpha(k)=-sign(A(k,k))*norm(A(k:m,k),2);
        ek=I(:,k);
        v(:,k)=[zeros(k-1,1); A(k:m,k)]-alpha(k)*ek;
        beta(k)=norm(v(:,k),2)^2;
        if beta(k) ~= 0
            for j=k:n
                gamma(j)=dot(v(:,k),A(:,j));
                A(:,j)=A(:,j)-(2*gamma(j)/beta(k))*v(:,k);
            end
            b=b-(2*dot(v(:,k),b)/beta(k))*v(:,k);
        end
    end
    x=bs(A,b);
end

% SVD
function x=svd_func(A,b)
    [u,d,v]=svd(A);
    x=(transpose(u(:,1))*b/d(1,1))*v(:,1)+...
    (dot(u(:,2),b)/d(2,2))*v(:,2);
    % u0=u(:,1:2); % d0=d(1:2,:);
    % xsvd=v*diag(1./diag(d0))*transpose(u0)*b;
end

%backward substitution
function x=bs(R,b)
    [m,n]=size(R);
    for j = n:-1:1
        if R(j,j) == 0
            break;
        end
        x(j,1) = b(j,1)/R(j,j);
        for i=1:(j-1)
            b(i,1)=b(i,1)-R(i,j)*x(j,1);
        end
    end
end