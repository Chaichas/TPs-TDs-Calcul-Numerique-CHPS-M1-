//Resolution par elimination de Gauss sans pivotage (Alg 12 p27)

function[x]=gausskij3b(A,b)

n = size(b)(1) //n

for k = 1:n-1
    for i = k+1:n
        mik = A(i,k)/A(k,k);
        b(i) = b(i) -mik*b(k);
        for j= k+1: n
        A(i,j) = A(i,j)-mik * A(k,j);
        end
    end
end

[x]=usolve(A,b) //Resolution de Ax = b par remontée: Appelation de l'Alg 10 (usolve)

endfunction
funcprot(0)
