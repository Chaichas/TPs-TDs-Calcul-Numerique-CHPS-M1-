//RHS vector: B
function [b] = RHS_vec(n, T0, T1)
        b = zeros(n, 1);
        b(1) = T0;
        b(n) = T1;

for i = 2: n-1
    b(i) = 0; //source g=0
end
endfunction
funcprot(0)
