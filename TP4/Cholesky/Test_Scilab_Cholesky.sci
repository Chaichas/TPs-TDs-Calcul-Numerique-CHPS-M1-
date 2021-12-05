//Validation avec la factorisation Cholesky de Scilab
//Reference: Scilab: https://help.scilab.org/docs/6.1.0/fr_FR/chol.html

W=rand(5,5); //matrice reele
X=W*W'; //X est une matrice symetrique

//X= matrice symetrique définie positive
//R est une matrice triangulaire supérieure
R=chol(X); //Cholesky factorisation function in Scilab

norm(R'*R-X) //Calcul d'erreur de factorisation commise

[L,d]=cholesky(A)
