/*Methode de Factorisation LDL'; A=L*D*L'
Forme Compacte de l;algorithme, ie aij est ecrasee par lij si i>j et di si i=j*/

function [L,d]=LDLFactorisation_Compacte(A)

n = size(A,1); //taille de la matrice A: Matrice carre de dim n*n

A(1,1) = A(1,1);
A(2:n,1) = A(2:n,1)/A(1,1);

for j=2:n  

    for i=1:j-1
        v(i)= A(j,i)*A(i,i); // Calcul du vecteur v
    end

    A(j,j)= A(j,j)-A(j,1:j-1)*v(1:j-1); //Calcul des elements du vecteur D
    A(j+1:n,j)=(A(j+1:n,j)-A(j+1:n, 1:j-1)*v(1:j-1) )/A(j,j); //Calcul des elements de L

end

//obtention de d et de L
d = diag(A); //coeff d de la matrice diagonale D
L = tril(A- diag(d),-1)+eye(n,n); //Matrice L triangulaire inferieure

endfunction
funcprot(0)
