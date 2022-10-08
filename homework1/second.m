figure(1)
y = @(C, x) atan(C * power(tan(x/2), 2));
x = linspace(-2*pi, 2*pi);
C = linspace(-5, 5, 8);
figure;
for i = 1:length(C)
    y1 = y(C(i), x);
    plot(x, y1);
    hold on;
end

title("Trajectory equation")
xlabel('$x$', Interpreter = 'latex', FontSize = 16)
ylabel('$y$', Interpreter = 'latex', FontSize = 16)
hold off
figure(2)
[x, y] = meshgrid(0:pi/6:2*pi);
v = sin(x);
u = sin(2*y);
quiver(x, y, v, u, 'r');
grid on;
hold on;
xlim([- 0.1, 2*pi + 0.1]);
ylim([- 0.1, 2*pi + 0.1]);
hold off



figure(3)
[x, y] = meshgrid(0:pi/6:2*pi);
v = sin(2*y);
u = sin(x);
quiver(x, y, v, u, 'r');
grid on;
hold on;
xlim([- 0.1, 2*pi + 0.1]);
ylim([- 0.1, 2*pi + 0.1]);
hold off

