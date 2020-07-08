% clear;
% clc;
function [angulosT]=INVERSA1(Px,Py,Pz)
% Px = input('CoordenadaX :  ');
% Py = input('CoordenadaY :  ');
% Pz = input('CoordenadaZ :  ');
%%
T1 = atan2d(Py,Px);
% Lv = Px+(172.5*(1-cosd(T1))); 
% Rotacionz = [cosd(T1) -sind(T1) 0 ; sind(T1) cosd(T1)  0; 0 0 1 ];
% punto= [Px; Py; Pz];
% matrix = Rotacionz*punto;
% x = matrix(1,1);
% y = matrix(2,1);
% z = matrix(3,1);
hp = sqrt(Px^2 + Py^2);
L= 130;
L1= 120;
L2= 120;
% Lv = cosd(T1)*hp;
h1 = 52.5;
h2 = 50;
h = +sqrt(h1^2 + h2^2);
hg = atan2d(h1,h2);
alpha2 = atan2d(hp,(Pz-L));
alpha1 = 90 - alpha2;
rho1 = 180 - hg - alpha2;
c= +sqrt(hp^2 + (Pz-L)^2);
c1 = +sqrt(c^2 + h^2 - 2*c*h*cosd(rho1));
aux = sind(rho1);
rho2 = asind(h*aux/c1);
alpha3 = acosd((L1^2 + c1^2 -L2^2)/(2*L1*c1));
Ta = alpha3 + rho2 + alpha1; % Respecto a la horizontal X 
T2 = round(90-Ta,2);

var = L1*sind(alpha3);
Eps = asind(var/L2);
Tb = 180-alpha3 - Eps;%T3 respecto a L2, lo que significa estará normalmente a 90° en posición inicial
T3 = round(90-Tb,2);
T = round(90-T3+T2,2);%
angulosT=[T1;T2;T3];
