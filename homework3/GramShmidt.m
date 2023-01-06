function [psi1, psi2, psi3] = GramShmidt(f1,f2,f3)

psi1 = f1 / sqrt(L2_inner_product(f1, f1));

phi2 = f2 - L2_inner_product(f2, psi1) * psi1;
psi2 = phi2 / sqrt(L2_inner_product(phi2, phi2));

phi3 = f3 - L2_inner_product(f3, psi1) * psi1 - L2_inner_product(f3, psi2) * psi2;
psi3 = phi3 / sqrt(L2_inner_product(phi3, phi3));

end

