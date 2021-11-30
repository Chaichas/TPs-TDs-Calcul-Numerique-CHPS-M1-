/*Test de l'algorithme de l'Élimination de Gauss et écriture compacte de LU (version scalaire à 3 boucles "kij")*/

A=rand(100,100); //Matrice A aleatoire

tic();
[L,U]=mylu3b(A); //Matrices tringulaires sup U et inf L
toc();
disp(toc()); //temps de calcul

err=norm(A-L*U); //Erreur commise de factorisation LU
disp(err);
