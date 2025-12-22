% --- Główny skrypt ---
tm = t2_resized; 
ym = x2_resized;

LB = [0.1 0.2 30]';   % dolne ograniczenia
UB = [200 0.5 40]';   % górne ograniczenia
C = 30; ALPHA = 0.3; X0 = 35;

x0_vec = [C ALPHA X0]';
global dx2
% lsqnonlin wymaga uchwytu do funkcji:
xopt2 = lsqnonlin(@(p) cel(p, tm, ym), x0_vec, LB, UB);

disp('Optymalne parametry:');
disp(xopt2);
figure;
plot(tm,ym,tm,dx2)
title("Zbiornik 2")
legend("original","math")

disp("Średnia błędu:")
disp(mean(abs(ym-dx2)))
% --- Funkcja celu (residua) ---
function q = cel(p, tm, ym)
    global dx2
    C = p(1); 
    ALPHA = p(2); 
    X0 = p(3);
    
    
    [~, x1] = ode45(@(t,x) rhs(t,x,C,ALPHA), tm, X0);
    dx2 = x1;
    e = x1(:,1) - ym(:);
    q = e;
end


% --- Równanie różniczkowe ---
function dx = rhs(~, x, C, ALPHA)
    global a b c r h w
    x = max(x, 0);   % zabezpieczenie przed wartościami ujemnymi
    S = w * (((b - a)/h) * x + a);
    dx = -C * x.^ALPHA ./ S;
end
