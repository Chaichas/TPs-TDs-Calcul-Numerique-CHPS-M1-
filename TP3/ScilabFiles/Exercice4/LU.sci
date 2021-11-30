/*Élimination de Gauss et écriture compacte de LU (version
scalaire à 3 boucles "kij") (Alg 13 p30)*/

function [L,U]=mylu3b(A)
[n n]=size(A);

for k = 1:n-1
    for i = k+1:n
        A(i,k)=A(i,k)/A(k,k);
    end
    for i = k+1:n
        for j = k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end

L = tril(A, -1)+eye(n,n); //matrice L triangulaire inferieure avec des 1 sur la diagolanle

U = triu(A); //matrice u triangulaire superieur

endfunction
funcprot(0)
