% b = linspace(-10, 10, 20);
syms x
b = linspace(-10, 10, 20);

f1 = exp(-abs(x));
f2 = exp(-2 * abs(x));

f = exp(-14 * x * x);
min_diff = inf;
param = 0;
for i = 1:length(b)
   
    f3 = exp(-b(i) * abs(x));
    
    [psi1, psi2, psi3] = GramShmidt(f1, f2, f3);
    c1 = L2_inner_product(psi1, f);
    
    c2 = L2_inner_product(psi2, f);
    

    c3 = L2_inner_product(psi3, f);
    p = c1 * psi1 + c2 * psi2 + c3 * psi3;
    diff = vpa(sqrt(L2_inner_product(f - p, f- p)));
    if diff < min_diff
        min_diff = diff;
        param = b(i);
    end
end




% for i = 1:b
    
% end