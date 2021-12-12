/*Methode de Factorisation: Cholesky; A=L*L'
A= matrice symetrique definie positive ==> On obtient la matrice L qui est triangulaire inferieure */

function [L] = cholesky(A)

n=size(A,1); //Taille de la matrice A: n*n

L(1,1) = sqrt(A(1,1)); //Calcul du 1er element de la matrice L
L(2:n,1) = A(2:n,1)/L(1,1); //Calcul des elements de la 1ere colonne de la matrice L


for i = 2:n //boucle sur les lignes
    L(i,i) = sqrt(A(i,i)-L(i,1:i-1)*L(i,1:i-1)'); //Calcul des coefficients sur la diagonale de L

    for j = i+1:n //boucle sur les colonnes
        L(j,i) = (A(j,i)-L(j,1:i-1)*L(i,1:i-1)')/L(i,i); //Calcul des autres coeffs de la matrice L
    end
end

endfunction
funcprot(0)
