clc; clearvars; close all
%%
xvec = linspace(0,5,101);
yvec = fnc_f(xvec);
figure; hold on; plot(xvec,yvec); axis equal
xlim([1.5 2.5]);
ylim([-1 1]);
%%
a=1; b=2; c=3;
fa=fnc_f(a); fb=fnc_f(b); fc=fnc_f(c);
disp(' x f(x) h');
disp('------------------------------------');
fprintf(' %1.6f %1.6f \n',a,fa);
fprintf(' %1.6f %1.6f \n',b,fb);
fprintf(' %1.6f %1.6f \n',c,fc);
plot([a b c], [fa fb fc],'o');
%%
tol=1e-6;
ErrorValue=tol+1;
while ErrorValue > tol
    % -- compute function values
    h=(a-c)*(b-c)*(fa-fb)*fc/( (a-c)*(fc-fb)*fa-(b-c)*(fc-fa)*fb );
    % -- linear fractional interpolation
    fprintf(' %1.6f %1.6f %1.6f \n',c,fc,h);
    % -- Update
    x=c+h; fx=fnc_f(x);
    plot(x,fx,'x'); pause(1);
    % -- compute error
    ErrorValue=abs(x-c);
    % -- update x
    a=b; fa=fb;
    b=c; fb=fc;
    c=x; fc=fx;
end
%%
function y=fnc_f(x)
y=x.^2-4*sin(x);
end
