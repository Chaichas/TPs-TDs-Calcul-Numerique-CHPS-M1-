//Test du Produit Matrice-Matrice "ijk" avec 2 boucles
A=rand(1000,900); //Matrice Aleatoire A
B=rand(900,980); //Matrice Aleatoire B

tic();
[C]=matmat2b(A, B)
toc();
disp(toc()); //printing the calculation time
