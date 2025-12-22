run resizing_data.m

cd ../data
load resized_models_data
load sizes
cd ../model_coeff_identification

run tank1.m
run tank2.m
run tank3.m

C = [xopt1(1) xopt2(1) xopt3(1)];
ALPHA = [xopt1(2) xopt2(2) xopt3(2)];

cd ../data
save ("model_coeff", "C", "ALPHA")
cd ..
clear

