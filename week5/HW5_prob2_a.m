clearvars; clc;
x=-5:0.1:5;
y=sin(10*x)-2*x;
plot(x,y)

ax=gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
