//Test du Poduit Matrice creuse Vecteur, CSR
A=[3,0,0,2,1;0,0,5,8,0;0,1,2,0,0;0,0,9,0,0;0,0,10,4,0]; //matrice creuse A (5*5)
x = [1,1,1,1,1]'; //n=5 (Ex5,i)
[AA,JA,IA]=CSR_SPMat(A); //stockage CSR de la matrice creuse A
[y]= CSR_SPMatVec(A,x); //produit matrice creuse vecteur (CSR)
