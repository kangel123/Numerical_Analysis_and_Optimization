clearvars; close all; clc
A=[1 0 0;0 1 0;0 0 1;-1 1 0;-1 0 1;0 -1 1];
[m,n]=size(A);
R=zeros(3);

for k=1:n
    R(k,k)=norm(A(:,k),2);
    Q(:,k)=A(:,k)/R(k,k);
    for j=k+1:n
        R(k,j)=transpose(Q(:,k))*A(:,j);
        A(:,j)=A(:,j)-R(k,j)*Q(:,k);
    end
end