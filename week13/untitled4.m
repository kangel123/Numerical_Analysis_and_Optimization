A=[2 2; 1 3; 2 4];
b=[2;10;5];
[u,d,v]=svd(A);
checkA=u*d*transpose(v);

x=(u(:,1)'*b/d(1,1))*v(:,1)+(u(:,2)'*b/d(2,2))*v(:,2);