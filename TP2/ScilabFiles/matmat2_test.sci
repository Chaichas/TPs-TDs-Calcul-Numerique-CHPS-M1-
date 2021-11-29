//Test du Produit Matrice-Matrice "ijk" avec 2 boucles
A=rand(3,2); //Matrice Aleatoire A
B=rand(2,3); //Matrice Aleatoire B

tic();
[C]=matmat2b(A, B)
toc();
disp(toc()); //printing the calculation time
