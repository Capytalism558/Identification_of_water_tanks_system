cd ../data

v_meas = [0.2454, 0.2139, 0.1828, 0.1540, 0.1225, 0.0910, 0.0618, 0.0311, 0.0012];
v_real = [25, 22, 19, 16, 13, 10, 7, 4, 1];

disp("Współczynniki a i b dla czujnika 1:")
coeff1 = polyfit(v_meas, v_real, 1)

v_meas = [0.2456, 0.2145, 0.1835, 0.1532, 0.1239, 0.0921, 0.0636, 0.0329, 0.0028];
v_real = [25, 22, 19, 16, 13, 10, 7, 4, 1];

disp("Współczynniki a i b dla czujnika 2:")
coeff2 = polyfit(v_meas, v_real, 1)

v_meas = [0.2497, 0.2140, 0.1840, 0.1586, 0.1293, 0.0994, 0.0675, 0.0364, 0.0062];
v_real = [25, 22, 19, 16, 13, 10, 7, 4, 1];

disp("Współczynniki a i b dla czujnika 3:")
coeff3 = polyfit(v_meas, v_real, 1)

sensor_coeff = [coeff1; coeff2; coeff3];
save("sensors_coeff", "sensor_coeff");

cd ../sensors_identification
clear;