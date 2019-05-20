% ME 473 Project 3
% Khrisna Kamarga
clear all; close all; clc;

rolldown = xlsread("Project3_K.xlsx");
calibrate = xlsread("Project3_Calibration.xlsx","Khrisna");

%%
close all; clc;

voltage = calibrate(:,1);
distance = calibrate(:,2);

fit = polyfit(voltage, distance, 1);
plot(voltage, polyval(fit, voltage));
hold on
plot(voltage, distance);
pause
hold off
%%
clc; close all;

cutaway = [1450, 1600];
time = rolldown(:,7);
time = time(cutaway(1):cutaway(2));
voltage = rolldown(:,8);
voltage = voltage(cutaway(1):cutaway(2));

displacement = fit(1)*voltage + fit(2);
P = polyfit(time.^2, displacement, 1);

trend =  P(1)* time.^2 + P(2);

syms rR
syms X

% X = solve((X*386.09*sind(7.34)*0.5)/(2/5 + X) == P(1), X);
X = solve((X*386.09*sind(5.36)*0.5)/(2/5 + X) == P(1), X);
X = vpa(X);
rR = sqrt(X);
Rr = 1/rR;

plot(time, displacement)
xlabel("time (s)");
ylabel("displacement (in)");
title("Track Angle = 5.36 degrees");
pause

plot(time.^2, displacement)
hold on
plot(time.^2, polyval(P, time.^2))
xlabel("time^2 (s)");
ylabel("displacement (in)");
title("Linear Fit");

pause

disp(Rr)

%%
close all; clc;
X = ((1.8+1.96)/2)^-2;
X = 1.8^-2;
coeff = (X*386.09*sind(5.36)*0.5)/(2/5 + X)

