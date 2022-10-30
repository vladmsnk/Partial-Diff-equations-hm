f_x3 = @(x) sin((0.5 + 3) * x);
f_x4 = @(x) sin((0.5 + 4) * x);
figure(1)
hold on
fplot(f_x3)
fplot(f_x4)
hold off
xlim([0, pi + 0.01])
xlabel('$x$', Interpreter = 'latex', FontSize = 16);
ylabel('$\sin(x)$', Interpreter = 'latex', FontSize = 16);
legend('U3','U4')

K = 10; 
L = pi;

x = linspace(0, L, 101);


T = [0, 0.01, 0.02, 0.1, 1];
C = zeros(K, 1);
figure(1)
lengendInfo = zeros(length(T));
for t = 1 :length(T)
    u = zeros(size(x));
    for k = 1 : K 
        func_up = @(x) (sin(3*x) - 2*x - 14).* sin((0.5 + k - 1) * x);
        func_down = @(x) sin((0.5 + k - 1) * x) .* sin((0.5 + k - 1) * x);
    
        inner_product_up = integral(func_up, 0, pi);
        inner_product_down = integral(func_down, 0, pi);
        
        C(k) = inner_product_up / inner_product_down;

%         u = u + C(k) * exp(-14 * (0.5 + k - 1)^2 * T(t)) .* sin((0.5 + k - 1) * x);

        u = u + C(k) * exp((-14 * (0.5 + k - 1)^2 + 20)* T(t)) .* sin((0.5 + k - 1) * x);
    end  
    u_final = u + 2*x + 14;
    plot(x, u_final, 'DisplayName', ['t = ', num2str(T(t))]);
    hold on
end
title('Solution')
xlabel('x');
ylabel('u');
legend('show');
hold off
