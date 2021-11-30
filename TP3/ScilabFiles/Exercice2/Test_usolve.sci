//Validation de l'exercice 7 du TP1 "Jouet"

A=[0.5819606, 0.6603468, 0.8009798; 0.9860136, 0.5958275, 0.5262907; 0.249952, 0.5903676, 0.1496625]; //Matrice A random 3*3 de l'ex Jouet, TP2

b= [0.847947; 0.6737939; 0.3919569]; //Vecteur b random 3*1

tic();
U= triu(A); //Matrice triangulaire superieure U a partir du matrice A
[x]=usolve(U,b); //solution du systeme triangulaire Ux=b
disp(x);
toc();
disp(toc());
funcprot(0)
