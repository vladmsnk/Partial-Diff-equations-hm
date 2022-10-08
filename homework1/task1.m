

u = @(t, x) sin(x);
dudt = @(t, x) zeros(size(x));
dudx = @(t, x) cos(x);


T = 5;
t = linspace(0, T, 11);
j = 0:10;
J = @(t) 2 * t * pi / 10;
x = J(j);

x0 = zeros(size(x));

figure(1)
for k = 1 : length(x)
    [t_path, x_path] = ode45(u, [0 T], x(k));
    plot(x_path, t_path);
    hold on;
    x0(k) = x_path(end);


    C = @(j) tan(pi * j/ 10) ;
    x_path = 2 * atan(C(k - 1) * exp(t));
    if x_path < 0
        x_path = x_path + 2 * pi;
    end
    plot(x_path, t, '*k');
end
hold off;
xlabel('$x$', Interpreter = 'latex', FontSize = 16);
ylabel('$t$', Interpreter = 'latex', FontSize = 16);

figure(2)
t = [-1 1 2 3];

x1 = zeros(size(x));
x2 = zeros(size(x));
x3 = zeros(size(x));
x4 = zeros(size(x));

for k = 1 : length(x)
    x_path = 2 * atan(C(k - 1) * exp(t));
    if x_path < 0
        x_path = x_path + 2 * pi;
    end
    x1(k) = x_path(1);
    x2(k) = x_path(2);
    x3(k) = x_path(3);
    x4(k) = x_path(4);
end
hold on
plot(j, x1)
plot(j, x2)
plot(j, x3)
plot(j, x4)
xlabel('$j$', Interpreter = 'latex', FontSize = 16);
ylabel('$x$', Interpreter = 'latex', FontSize = 16);
legend('t = -1', 't = 1', 't = 2', 't = 3');
hold off

%% Conservation of mass equation
figure(3)
rho = zeros(1, length(x));
T = -1;
rhof = {@(x) 1, @(x) power(x - pi, 2) + 1, @(x) x - pi + 1};
figure(3)
hold on
for i = 1:length(rhof)
    func = rhof{i};
    rho_0 = ones(1, 11);
    for k = 1 : length(x)
        if x(k) > pi
           rho_0(k) = func(x(k));
        end
        [t_path, x_path] = ode45(u, [0 T], x(k));
        app_rho_0 = spline(x, rho_0, x_path(end));
    
        dudx_path = dudx(t_path, x_path);
        dpath = [diff(x_path), diff(t_path)];
        h = sqrt(sum(dpath.^2, 2));
        integ = .5*(dudx_path(2:end) + dudx_path(1:end-1)).' * h;
        rho(k) = app_rho_0 * exp(-integ);
    end
    hold on
    plot(x, rho_0);
    hold on
    plot(x, rho);
    xlabel('$x$', Interpreter = 'latex', FontSize = 16)
    ylabel('$\rho$', Interpreter = 'latex', FontSize = 16)
end
hold off
% 
%% Density change visualisation

