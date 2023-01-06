syms x
f1 = exp(-abs(x));
f2 = exp(-2 * abs(x));
f3 = exp(-3 * abs(x));

[psi1, psi2, psi3] = GramShmidt(f1, f2, f3);

f = exp(-14 * x * x);
c1 = L2_inner_product(psi1, f);

c2 = L2_inner_product(psi2, f);

c3 = L2_inner_product(psi3, f);

p = c1 * psi1 + c2 * psi2 + c3 * psi3;


figure(1)
hold on
fplot(f, 'b')
fplot(p, 'r')
xlabel('x')
ylabel('f(x)')
title('Approximation')
legend('$f(x)$','$p(x)$','Interpreter','latex')
hold off