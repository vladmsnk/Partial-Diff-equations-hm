C = @(j) sin(pi * j/ 10);
j = 1:10;
c_0 = C(j);

for i = 1:length(c_0)
    t = 0:pi/50:10*pi;
    st = 2 * atan(c_0(i) * exp(t));
    ct =  atan(c_0(i) * exp(2*t));
    plot3(st,ct,t)
    hold on 
end

