cd ../data
load models_data

% usuwanie krancow

subplot(3,2,1)
% x - 1.5, 41
plot(t1,x1)

subplot(3,2,3)
% x - 1.3, 36
plot(t2,x2)

subplot(3,2,5)
% x - 3.2, 51.3
plot(t3,x3)

x1_resized = x1(160:4090);
t1_resized = t1(160:4090)-1.59;

x2_resized = x2(140:3590);
t2_resized = t2(140:3590)-1.39;

x3_resized = x3(330:5145);
t3_resized = t3(330:5145)-3.805;

subplot(3,2,2)
% x - 1.5, 41
plot(t1_resized,x1_resized)

subplot(3,2,4)
% x - 1.3, 36
plot(t2_resized,x2_resized)

subplot(3,2,6)
% x - 3.2, 51.3
plot(t3_resized,x3_resized)

save("resized_models_data", "t1_resized","x1_resized","t2_resized","x2_resized","t3_resized","x3_resized")

cd ../model_coeff_identification
clear