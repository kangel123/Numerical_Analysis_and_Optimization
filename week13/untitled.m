clearvars; close all; clc

a1=[2;1;2];
alpha=-sign(a1(1))*norm(a1);
e1=[1;0;0];

v1=a1-alpha*e1;
H1=eye(3)-2*(v1*v1')/(v1'*v1);

check_H1=H1*a1;
check_v1=a1-2*((v1'*a1)/(v1'*v1))*v1;

disp(check_H1);
disp(check_v1);