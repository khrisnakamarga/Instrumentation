%% ME 473 HW3 Prob 6

clear all; close all; clc;

syms k s Vo Vi VA VB R1 R2 C1 C2 T;

Eqs = [(VA - Vo)/R1 + (VA - VB)*s*C2 - (Vi - VA)*s*C1;
        VB - Vo/k;
        VA*s*C2 - VB*(1/R2 + s*C2);
        T - Vo/Vi];
Sol = solve(Eqs, VA, VB, T, Vo, Vi);
ans = simplify(Sol.T, 5)
pretty(ans)
latex(ans)

%%
num = [4 0 0];
den = [3 1 1];
sys = tf(num,den);
bode(sys)

%% ME 473 HW3 Prob 7

clear all; close all; clc;

syms k s Vo Vi VA VB VC R1 R2 R3 C1 C2 T;

Eqs = [(VA-Vo)/R2 + (VA-VB)*s*C1 - (Vi-VA)/R1;
        -(VA-VB)*s*C1 + VB/R3 + VC*s*C2;
        VC - Vo/k;
        T - Vo/Vi;
        VB - VC];
Sol = solve(Eqs, VA, VB, VC, T, Vo, Vi);
ans = simplify(Sol.T, 6)
latex(ans)

%%
num = [2 0];
den = [1 100 1];
sys = tf(num,den);
bode(sys);