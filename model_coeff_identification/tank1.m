% --- Główny skrypt ---
tm = t1_resized; 
ym = x1_resized;

LB = [0.1 0.2 30]';   % dolne ograniczenia
UB = [200 0.5 40]';   % górne ograniczenia
C = 30; ALPHA = 0.3; X0 = 35;

x0_vec = [C ALPHA X0]';
global dx1
% lsqnonlin wymaga uchwytu do funkcji:
xopt1 = lsqnonlin(@(p) cel(p, tm, ym), x0_vec, LB, UB);

disp('Optymalne parametry:');
disp(xopt1);
figure;
plot(tm,ym,tm,dx1)
legend("original","math")
title("Zbiornik 1")

disp("Średnia błędu:")
disp(mean(abs(ym-dx1)))
% --- Funkcja celu (residua) ---
function q = cel(p, tm, ym)
    global dx1
    C = p(1); 
    ALPHA = p(2); 
    X0 = p(3);
    
    
    [~, x1] = ode45(@(t,x) rhs(t,x,C,ALPHA), tm, X0);
    dx1 = x1;
    e = x1(:,1) - ym(:);
    q = e;
end


% --- Równanie różniczkowe ---
function dx = rhs(~, x, C, ALPHA)
    global a b c w r h
    x = max(x, 0);   % zabezpieczenie przed wartościami ujemnymi
    S = c * w;
    dx = -C * x.^ALPHA ./ S;
end
