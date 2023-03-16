clearvars; close all; clc

A=[1 1;1 1;1 1;1 1];
b=[2;10;5;1];

a1=A(:,1);
alpha=-sign(a1(1))*norm(a1);
e1=[1;0;0; 0];
v1=a1-alpha*e1;
H1=eye(4)-2*(v1*v1')/(v1'*v1);
newA=H1*A;
newb=H1*b;

a2=newA(:,2)
alpha=-sign(a2(2))*norm(a2(2:4,1));
e2=[0;1;0;0];
v2=[0; a2(2:4,1)]-alpha*e2
H2=eye(4)-2*(v2*v2')/(v2'*v2)
newA=H2*newA;
newb=H2*newb;

Q=H1'*H2';
R=H2*H1*A;

% H2*H1*A==R
% A==H1'*H2'*R
% A==QR