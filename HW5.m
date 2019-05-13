%ME 473 - HW5
%Khrisna Kamarga

%% Problem 1

clear all; close all; clc;

RmRmax = [0.1, 1, 10];
thetaThetaMax = linspace(0, 1);

hold on
for i = RmRmax
    error = (i./(i + thetaThetaMax - thetaThetaMax.^2) - 1) * 100;
    plot(thetaThetaMax, error);
end
title("error % vs \theta/\theta_{max}");
legend("R_m/R_{max} = 0.1", "R_m/R_{max} = 1.0", "R_m/R_{max} = 10", "Location", "best");
xlabel("\theta/\theta_{max}");
ylabel("error %");

%% Problem 3
clc;

hold on
for i = RmRmax
    sensitivity = (i*(thetaThetaMax.^2 + i))./(thetaThetaMax.^2 - thetaThetaMax - i).^2;
    plot(thetaThetaMax, sensitivity);
end
title("Sensitivity plot for various R_m/R_{max} values");
legend("R_m/R_{max} = 0.1", "R_m/R_{max} = 1.0", "R_m/R_{max} = 10", "Location", "best");
xlabel("\theta/\theta_{max}");
ylabel("sensitivity");

%% Problem 2
clear all; clc; close all;

Rc = 1;
a = linspace(0,1);
ratio = linspace(0.1,0.9,9);
ratio = [ratio linspace(1,10,10)];


hold on
for i = ratio
    Rl = i*Rc;
    for j = 1
        Re = j*Rc;
        y = Rc*Rl*a./((2*Re+Rc*(1-a)).*(Rc*a+Rl)+Rc*Rl*a);
        plot(a,y);
    end
end
title("V_0/V_{ref} vs. variations of R_L and R_e");
xlabel("x/L");
ylabel("v_0/v_{ref}");