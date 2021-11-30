/*LU Optimisee a une boucle*/

function [L,U]=mylu1b(A)
[n n]=size(A);

for k = 1:n-1

    A( k+1:n,k)=A( k+1:n,k)/A(k,k);    
    A(k+1:n, k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
        
end
L = tril(A, -1)+eye(n,n); //matrice L triangulaire inferieure avec des 1 sur la diagolanle

U = triu(A); //matrice u triangulaire superieur

endfunction
funcprot(0)
