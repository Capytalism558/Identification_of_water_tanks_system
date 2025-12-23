clear all; close all
cd ../data
load pump_coeff
load model_coeff
load sizes
cd ../testing_regulators

REGULATOR = 1;
upper_integral_sat = 100;

x3SP = 10;
x1SP = ((C(3)/C(1)) * x3SP^ALPHA(3))^(1/ALPHA(1));
x2SP = ((C(3)/C(2)) * x3SP^ALPHA(3))^(1/ALPHA(2));
uSP = C(3) * x3SP^ALPHA(3);

xSP = [x1SP, x2SP, x3SP];

A_matrix = [(-C(1) * ALPHA(1))/(a * w * xSP(1)^(1-ALPHA(1))),                                                                                                 0,                                                                                    0;
            (C(1) * ALPHA(1))/(w * (c + b * (xSP(2)/H2max)) * xSP(1)^(1 - ALPHA(1))), (-C(2) * ALPHA(2))/(w * (c + b * (xSP(2)/H2max)) * xSP(2)^(1 - ALPHA(2))),                                                                                    0;
            0,                                                                        (C(2) * ALPHA(2))/(w * sqrt(r^2 - (H3max - xSP(3))^2) * xSP(2)^(1 - ALPHA(2))), (-C(3) * ALPHA(3))/(w * sqrt(r^2 - (H3max - xSP(3))^2) * xSP(3)^(1 - ALPHA(3)))]
B_matrix = [(a * w)^-1; 0; 0]
C_matrix = [0, 0, 1]
D_matrix = [0]

Q_matrix = diag([10e5, 10e5 ,10e5])
R_matrix = 14000

sys_tf = tf(ss(A_matrix, B_matrix, C_matrix, D_matrix))

[K_matrix, S_matrix, E_matrix] = lqr(A_matrix, B_matrix, Q_matrix, R_matrix)
K_matrix(4) = 0;

cd ../models
sim main_model

cd ../testing_regulators
