% --- Główny skrypt ---
tm = t3_resized; 
ym = x3_resized;

LB = [0.1 0.2 30]';   % dolne ograniczenia
UB = [200 0.5 40]';   % górne ograniczenia
C=22;ALPHA=0.4;X0=37;

x0_vec = [C ALPHA X0]';
global dx3
% lsqnonlin wymaga uchwytu do funkcji:
xopt3 = lsqnonlin(@(p) cel(p, tm, ym), x0_vec, LB, UB);

disp('Optymalne parametry:');
disp(xopt3);
figure;
plot(tm,ym,tm,dx3)
title("Zbiornik 3")
xlim([0,50])
legend("original","math")

disp("Średnia błędu:")
disp(mean(abs(ym-dx3)))
% --- Funkcja celu (residua) ---
function q = cel(p, tm, ym)
    global dx3
    C = p(1); 
    ALPHA = p(2); 
    X0 = p(3);
    
    
    [~, x1] = ode45(@(t,x) rhs(t,x,C,ALPHA), tm, X0);
    dx3 = x1;
    e = x1(:,1) - ym(:);
    q = e;
end


% --- Równanie różniczkowe ---
function dx = rhs(~, x, C, ALPHA)
    global a b c r h w
    x = max(x, 0);   % zabezpieczenie przed wartościami ujemnymi
    S = w * sqrt(2 * r * x - x^2);
    dx = -C * x.^ALPHA ./ S;
end
