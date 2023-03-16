clc;clear;

t_ini = 0; t_ter = 1;
N_nod=5;
t_nod=linspace(t_ini,t_ter,N_nod);
N_pts=19;
t_vec=linspace(t_ini,t_ter,N_pts*(N_nod-1)+N_nod);

b0_1 = fnc_b0spline(t_vec,1,t_nod);
b0_2 = fnc_b0spline(t_vec,1,t_nod);
figure; plot(t_vec,b0_1,'k-')

function y=fnc_b0spline(t_vec,idx_i,t_nod)
y= zeros(size(t_vec));
y(t_vec>=t_nod(idx_i)&t_vec<t_nod(idx_i+1))=1;
end
