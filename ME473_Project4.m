%ME 473 - Project 4
%Khrisna Kamarga
clear all; close all; clc;

%Variables
E = 69e+9;
Kd = 390.3;

%Measurements
b=1.177*0.0254;
h=0.1878*0.0254;
L=11.875 *0.0254;
%Calculate K
k = 4*Kd*L^3/(E*b*h^3);
display(k);

%Uncertainties
dKd = 13.14;
dE = 0.35e+9;
db = 0.001*0.0254;
dh = 0.0005*0.0254;
dL = 1/64 *0.0254;
values = [E b h L Kd];

%Uncertainty of K
syms E b h L Kd;
K = Kd/(E*b*h^3/(4*L^3));
dK = sqrt((diff(K,b)*db)^2 + (diff(K,E)*dE)^2 + (diff(K,h)*dh)^2 ...
           + (diff(K,L)*dL)^2 + (diff(K,Kd)*dKd)^2);
symbolic = [E b h L Kd];
dK = subs(dK, symbolic, values);
dK = double(dK);
display(dK)

% Uncertainty Contribution
UE = (diff(K,E)*dE);
UE = double(subs(UE, symbolic, values))
Ub = (diff(K,b)*db);
Ub = double(subs(Ub, symbolic, values))
Uh = (diff(K,h)*dh);
Uh = double(subs(Uh, symbolic, values))
UL = (diff(K,L)*dL);
UL = double(subs(UL, symbolic, values))
UKd = (diff(K,Kd)*dKd);
UKd = double(subs(UKd, symbolic, values))

% Analytical Percent Error
err_K = 100*(0.167119 - K)/K;
err_K = double(subs(err_K, symbolic, values))


