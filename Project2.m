%% ME 473 Project 2
clear all; close all; clc;

R1 = 17.99e+03;
R2 = 30e+03;
C1 = 0.999e-06;
C2 = 0.4699e-06;

wn = sqrt(1/(C1*C2*R1*R2)) %/(2*pi)

p = [1 (R1+R2)/(C1*R1*R2) 1/(C1*C2*R1*R2)];
r = roots(p);

w = [10^(-1)*wn 10^(-0.5)*wn wn 10^(1/4)*wn 10^(1/2)*wn 10^(3/4)*wn 10*wn];
f = w./(2*pi)
%G = (1/(C1*C2*R1*R2))./(s.^2 + s.*(R1+R2)/(C1*R1*R2) + 1/(C1*C2*R1*R2));

gain = (1/(C1*C2*R1*R2))./sqrt((1./(C1*C2*R1*R2) -w.^2).^2 + ((R1+R2)/(C1*R1*R2).*w).^2)

num = 1/(C1*C2*R1*R2);
denom = [1 (R1+R2)/(C1*R1*R2) 1/(C1*C2*R1*R2)];
sys = tf(num,denom);
bode(sys)

vi = [9.533 9.995 9.995 9.995 9.995 9.995 9.995];
vo = [9.181 9.930 6.979 2.966 0.983 0.315 0.102];
realgain = vo./vi

error = (gain - realgain)./gain * 100

%%
close all;
w = linspace(0,120,1000)*2*pi;
gain = (1/(C1*C2*R1*R2))./sqrt((1./(C1*C2*R1*R2) -w.^2).^2 + ((R1+R2)/(C1*R1*R2).*w).^2);
semilogx(w/(2*pi), 20*log10(gain))
hold on
w = [10^(-1)*wn 10^(-0.5)*wn wn 10^(1/4)*wn 10^(1/2)*wn 10^(3/4)*wn 10*wn];
gain = (1/(C1*C2*R1*R2))./sqrt((1./(C1*C2*R1*R2) -w.^2).^2 + ((R1+R2)/(C1*R1*R2).*w).^2);
semilogx(w/(2*pi), 20*log10(realgain),"x","MarkerSize",10,"LineWidth",3)
xlabel("\omega (Hz)");
ylabel("gain (dB)");
ylim([-43 0.5]);
xlim([0 100]);
grid on
title("Bode Plot of the Gain of the Filter with Real Gain Values")
%%
close all;
w = linspace(0,120,1000)*2*pi;
gain = (1/(C1*C2*R1*R2))./sqrt((1./(C1*C2*R1*R2) -w.^2).^2 + ((R1+R2)/(C1*R1*R2).*w).^2);
loglog(w, gain)
hold on
w = [10^(-1)*wn 10^(-0.5)*wn wn 10^(1/4)*wn 10^(1/2)*wn 10^(3/4)*wn 10*wn];
gain = (1/(C1*C2*R1*R2))./sqrt((1./(C1*C2*R1*R2) -w.^2).^2 + ((R1+R2)/(C1*R1*R2).*w).^2);
loglog(w, realgain, "*")
xlabel("\omega (rad/s)");
ylabel("gain (dB)");
% ylim([10^(-2.15) 10^(0.2)]);
grid on


