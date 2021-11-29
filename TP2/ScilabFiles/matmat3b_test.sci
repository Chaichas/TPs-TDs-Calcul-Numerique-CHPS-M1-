//Test du Produit Matrice-Matrice "ijk" avec 3 boucles (Alg 7 p23)
A=rand(10,5); //Matrice Aleatoire A
B=rand(5,6); //Matrice Aleatoire B

tic();
C=matmat3b(A, B)
toc();
disp(toc()); //printing the calculation time
