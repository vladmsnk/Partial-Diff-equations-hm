

syms x
n = 1;
eqn = besselj(n, sqrt(x) * R1) * bessely(n,sqrt(x) * R2) - besselj(n,sqrt(x) * R2) * bessely(n,sqrt(x) * R1);
fun = matlabFunction(eqn);
x0 = 1:1.5:15;
sol = zeros(length(x0));
for k = 1:numel(x0)   
    sol(k) = fsolve(fun,x0(k));
end
lambdas = sol(1:5);

R1=1;
R2=15;
x = 1:1:15;
j0 = zeros(5, length(x));
for i = 0:4
    j0(i+1,:) = besselj(n,lambdas(i+1) * R1) * bessely(n,lambdas(i+1) * x * R2) - besselj(n,lambdas(i+1) * R2) * bessely(n,lambdas(i+1) * x * R1);
end
plot(x,j0)
grid on
legend('J_0','J_1','J_2','J_3','J_4','Location','Best')
title('Bessel Functions of the First Kind for $\nu \in [0, 4]$','interpreter','latex')
xlabel('r','interpreter','latex')
ylabel('$J_\nu(z)$','interpreter','latex')
% J = besselj(1, )