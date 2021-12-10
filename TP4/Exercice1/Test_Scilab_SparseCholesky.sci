//Si X est une matrice creuse reelle symetrique et definie positive
//Reference: Scilab: https://help.scilab.org/docs/6.1.0/fr_FR/spchol.html

//R= matrice de Cholesky
//P= matrice de permutation

// Factorisation d une matrice cresue:
Xfull = [
3.,  0.,  0.,  2.,  0.,  0.,  2.,  0.,  2.,  0.,  0.
0.,  5.,  4.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0.
0.,  4.,  5.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0.
2.,  0.,  0.,  3.,  0.,  0.,  2.,  0.,  2.,  0.,  0.
0.,  0.,  0.,  0. , 5.,  0.,  0.,  0.,  0.,  0.,  4.
0.,  0.,  0.,  0.,  0.,  4.,  0.,  3.,  0.,  3.,  0.
2.,  0.,  0.,  2.,  0.,  0.,  3.,  0.,  2.,  0.,  0.
0.,  0.,  0.,  0.,  0.,  3.,  0.,  4.,  0.,  3.,  0.
2.,  0.,  0.,  2.,  0.,  0.,  2.,  0.,  3.,  0.,  0.
0.,  0.,  0.,  0.,  0.,  3.,  0.,  3.,  0.,  4.,  0.
0.,  0.,  0.,  0.,  4.,  0.,  0.,  0.,  0.,  0.,  5.];

X = sparse(Xfull); //conversion de la matrice complete avec des 0 en une matrice creuse

[R, P] = spchol(X); //Factorisation de Cholesky pour une matrice creuse X

err=max(P*R*R'*P'-X) //Erreur max entre X et la factorisation de Cholesky
disp(err);

//2eme exemple
// Factorisation puis résolution avec l'opérateur '\':
Afull = [
2 -1  0  0  0;
-1  2 -1  0  0;
0 -1  2 -1  0;
0  0 -1  2 -1;
0  0  0 -1  2
];
A = sparse(Afull); //conversion de A en une matrice creuse

[L, P] = spchol(A); //Factorisation de Cholesky pour une matrice creuse A

err=max(P*L*L'*P'-A); //Erreur max entre A et la factorisation de Cholesky
disp(err);

n = size(A, "r"); //taille de A

e = (1:n)'; //e=vecteur colonne (n*1)
b = A * e; //b vecteur colonne

x = P*(L'\(L\(P'*b))); //resolution du systeme lineaire a l'aide de cholesky

A*x-b //verification de l'erreur commise


