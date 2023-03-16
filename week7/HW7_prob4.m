clc;clear;
%%
d1=[-5, 18]; t1=d1(1); y1=d1(2);
d2=[ 0, -12]; t2=d2(1); y2=d2(2);
d3=[ 2, -10]; t3=d3(1); y3=d3(2);
d=[d1; d2; d3];
weight1=1/( (t1-t2)*(t1-t3) );
weight2=1/( (t2-t1)*(t2-t3) );
weight3=1/( (t3-t1)*(t3-t2) );
t= linspace(-10,10);
L1=(t-t2).*(t-t3) * weight1;
L2=(t-t1).*(t-t3) * weight2;
L3=(t-t1).*(t-t2) * weight3;
p=y1*L1+y2*L2+y3*L3;
plot(t,p)
