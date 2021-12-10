/*Methode de Factorisation LDL'; A=L*D*L'
Forme Compacte de l;algorithme, ie aij est ecrasee par lij si i>j et di si i=j*/

function [L,D]=LDLFactorisation_Compacte(A)

n = size(A,1); //taille de la matrice A: Matrice carre de dim n*m

A(1,1) = A(1,1);
A(2:n,1) = A(2:n,1)/A(1,1);

for j=2:n  

    for i=1:j-1
        v(i)= A(j,i)*A(i,i); // Calcul du vecteur v
    end

    A(j,j)= A(j,j)-L(j,1:j-1)*v(1:j-1); //Calcul des elements du vecteur D
    A(j+1:n,j)=(A(j+1:n,j)-A(j+1:n, 1:j-1)*v(1:j-1) )/A(j,j); //Calcul des elements de L

end

D = diag(A); //Matrice diagonale D
L = tril(A- diag(D),-1)+eye(n,n);

endfunction
funcprot(0)
