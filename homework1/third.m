%psi > 0
f1 = @(psi) -sqrt(2*pi) * exp(-14 * psi);


%psi < 0
f2 = @(psi) -sqrt(2*pi) * 14 * exp(psi);


ps1 = linspace(0, 1);
ps2 = linspace(-10, -1);

phi1 = f1(ps1);
phi2 = f2(ps2);
plot(phi2, ps2)
title("E < 0")
xlabel('$e$', Interpreter = 'latex', FontSize = 16);
ylabel('$\psi$', Interpreter = 'latex', FontSize = 16);