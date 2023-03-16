clearvars; clc
A=[1 0;1 1; 2 300];
b=[10;2;1];

solx_n0=fnc_solver_norm(A,b);
solx_q0=fnc_solver_qr(A,b);
solx_s0=fnc_solver_svd(A,b);

b=[1;2;3+1];
solx_n1=fnc_solver_norm(A,b);
solx_q1=fnc_solver_qr(A,b);
solx_s1=fnc_solver_svd(A,b);

fnc_disp('Normal equation',solx_n0,solx_n1);
fnc_disp('QR factorization',solx_q0,solx_q1);
fnc_disp('SVD',solx_s0,solx_s1);

function x=fnc_solver_norm(A,b)
    x=inv(A'*A)*A'*b;
end

function x=fnc_solver_qr(A,b)
    [Q,R]=qr(A);
    Q0=Q(:,1:2);
    R0=R(1:2,:);
    c=transpose(Q0)*b;
    x(2,1)=c(2)/R0(2,2);
    x(1,1)=(c(1)-R0(1,2)*x(2,1))/R0(1,1);
end

function x=fnc_solver_svd(A,b)
    [u,d,v]=svd(A);
    x=(transpose(u(:,1))*b/d(1,1))*v(:,1)+...
    (dot(u(:,2),b)/d(2,2))*v(:,2);  
    % u0=u(:,1:2); % d0=d(1:2,:);
    % xsvd=v*diag(1./diag(d0))*transpose(u0)*b;
end

function fnc_disp(solvername,sol0,sol1)
fprintf([solvername, ' solution is: [']);
fprintf('%g ', sol0); fprintf('] and [');
fprintf('%g ', sol1); fprintf('] \n');
end