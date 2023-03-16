clc;clear;

t_ini = 0; t_ter = 1;
N_nod=5;
degree=2;

t_nod=linspace(t_ini-degree*(t_ter-t_ini)/(N_nod-1),t_ter+degree*(t_ter-t_ini)/(N_nod-1),N_nod+2*degree);
N_pts=19;
t_vec=linspace(t_ini-degree*(t_ter-t_ini)/(N_nod-1),t_ter+degree*(t_ter-t_ini)/(N_nod-1),N_pts*(N_nod-1)+N_nod);

b2_1 = fnc_b2spline(t_vec,1,t_nod);
b2_2 = fnc_b2spline(t_vec,2,t_nod);
b2_3 = fnc_b2spline(t_vec,3,t_nod);
b2_4 = fnc_b2spline(t_vec,4,t_nod);
b2_5 = fnc_b2spline(t_vec,5,t_nod);
b2_6 = fnc_b2spline(t_vec,6,t_nod);


plot(t_vec,b2_1,'b-')
hold on
plot(t_vec,b2_2,'c-')
plot(t_vec,b2_3,'r-')
plot(t_vec,b2_4,'y-')
plot(t_vec,b2_5,'k-')
plot(t_vec,b2_6,'m-')
xlim([0,1])


function y=fnc_b0spline(t_vec,idx_i,t_nod)
    y= zeros(size(t_vec));
    y(t_vec>=t_nod(idx_i)&t_vec<t_nod(idx_i+1))=1;
end

function y=fnc_b1spline(t_vec,idx_i,t_nod)
    y= zeros(size(t_vec));
    y=((t_vec-t_nod(idx_i))/(t_nod(idx_i+1)-t_nod(idx_i))).*fnc_b0spline(t_vec,idx_i,t_nod) + (1-(t_vec-t_nod(idx_i+1))/(t_nod(idx_i+2)-t_nod(idx_i+1))).*fnc_b0spline(t_vec,idx_i+1,t_nod);
 
end

function y=fnc_b2spline(t_vec,idx_i,t_nod)
    y= zeros(size(t_vec));
    y=((t_vec-t_nod(idx_i))/(t_nod(idx_i+2)-t_nod(idx_i))).*fnc_b1spline(t_vec,idx_i,t_nod) + (1-(t_vec-t_nod(idx_i+1))/(t_nod(idx_i+3)-t_nod(idx_i+1))).*fnc_b1spline(t_vec,idx_i+1,t_nod);
end