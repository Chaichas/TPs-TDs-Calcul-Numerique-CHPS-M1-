//Test du Poduit Matrice creuse Vecteur, CSR
//A=[3,0,0,2,1;0,0,5,8,0;0,1,2,0,0;0,0,9,0,0;0,0,10,4,0]; //matrice creuse A (5*5)
//x = [1,1,1,1,1]'; //n=5 (Ex5,i)
//[AA,JA,IA]=CSR_SPMat(A); //stockage CSR de la matrice creuse A
//[y]= CSR_SPMatVec(A,x); //produit matrice creuse vecteur (CSR)

//Test de l'algo produit matrice vecteur

//Test n1
A= [1,0,0,2,0;3,4,0,5,0;6,0,7,8,9;0,0,10,11,0;0,0,0,0,12]; //matrice A(5*5)
x = [1,1,1,1,1]'; //n=5 (Ex5,i)
tic();
[y]= CSR_SPMatVec(A,x);
toc();
disp(toc());
disp(y); //Display le produit de A*x

//Test de l'algo avec Scilab
y1=A*x;
err=norm(y-y1);
disp(err); //err=0 --> Algo valide

//Test n2
A2= [5,0,0,22,0,-15;0,11,3,0,0,4;0,0,0,-6,0,0]; //matrice A(6*3)
x2 = [1,0,0,1,0,0]'; //n=6 (Ex5,ii)
[y2]= CSR_SPMatVec(A2,x2);
disp(y2); //Display le produit de A2*x2

//Test de l'algo avec Scilab
y3=A2*x2;
err2=norm(y3-y2);
disp(err2); //err=0 --> Algo valide

funcprot(0)
