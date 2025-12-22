cd ../data
load sizes

pump = [0.53 0.6083 0.6867 0.7650 0.8433 0.9217 1];
t = [83.18 39.88 19.93 15.02 12.26 10.58 9.72]; %s
v = 15 * c * w;
flow = v ./ t; %cm^3/s
plot(pump, flow, 'or');
hold on;
grid on;
pump_coeff = polyfit(pump, flow, 2);
pump_fit = linspace(0.53, 1, 200);
flow_fit = polyval(pump_coeff, pump_fit);
plot(pump_fit, flow_fit);
hold off;
xlabel('Wartoœæ pompy');
ylabel('przep³yw [cm^3/s]');

save("pump_coeff", "pump_coeff");
cd ..
clear;
