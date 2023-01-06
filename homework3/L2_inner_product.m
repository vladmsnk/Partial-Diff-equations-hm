function [L2] = L2_inner_product(f1,f2)

L2_1 = int(f1 * f2, -inf,  0);
L2_2 = int(f1 * f2, 0,  inf);
L2 = L2_1 + L2_2;

end

