//Algorithm 14 Pivot Partiel
function [L,U,P]=mylu(A)
[n n] = size (A)

[piv, ind] = max(abs(A(k:n,k)));
ind = k-1+ind;
q = row(1, ind);
if (ind ~= k) then
    new = A(ind, :);
    A(ind, :)= A(k, :);
    row(1, ind) = row(1, k);
    row(1:k)=q;
end
endfunction
funcprot(0)
