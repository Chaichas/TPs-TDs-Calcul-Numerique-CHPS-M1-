/*Methode de Factorisation LDL'; A=L*D*L'
A= matrice symetrique et D=diag(d)
si on a W qlq, on fait: A=W*W' pour que A soit symetrique*/

function [L,D]=LDLFactorisation(A)

n = size(A,1); //taille de la matrice A: Matrice carre de dim n*m

for i = 1:n
    L(i,i)=1; //Tous les coeffs de L sur la diagonale sont egales a 1
end

D(1) = A(1,1); //1er element du vecteur D
L(2:n,1) = A(2:n,1)/D(1); //Coeffs de la 1ere colonne de la matrice L

for j=2:n  

    for i=1:j-1
        v(i)= L(j,i)*D(i); // Calcul du vecteur v
    end

    D(j)= A(j,j)-L(j,1:j-1)*v(1:j-1); //Calcul des elements du vecteur D
    L(j+1:n,j)=(A(j+1:n,j)-L(j+1:n, 1:j-1)*v(1:j-1) )/D(j); //Calcul des elements de L

end

endfunction
funcprot(0)
