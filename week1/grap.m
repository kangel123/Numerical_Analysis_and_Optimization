clear all;
x = -pi/2:pi/200:pi/2;
y = cos(x) + x.^2 -1;
plot(x,y,'b.-')