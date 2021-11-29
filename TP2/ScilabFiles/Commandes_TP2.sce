//Commandes du TP2

//TP6
x= [2, 4, 6, 8] //vecteur x a 1 ligne et 4 colonnes
y= [7; 1; 8; 2] //vecteur y a 4 lignes et 1 colonnes

z=x+y' //addition de x et transpose(y)
s=x*y //multiplication de x et y

size(x) //longueur de x  //1.   4.
size(y) //longueur de y  //4.   1.

norm(x,2) //Norme 2 de x

A= [1, 3, 7, 13; 1, 5, 9, 71; 8, 10, 50, 45] //matrice A a 4 lignes et 3 colonnes
A' //transpose de A

A= [1, 3, 7, 13; 1, 5, 9, 71; 8, 10, 50, 45; 8, 7, 5, 1] //matrice A 4*4
B= [18, 0, 1, 13; 21, 45, 19, 0; 18, 20, 51, 45; 3, 7, 9, 26] //matrice B 4*4
sum=A+B //operation MatAdd
mul=A*B //Operation MatMul
C1=A' //Transpose de A
C2=B' //Transpose de B
lambda=50 //Definition d'un scalaire
A1=lambda*A //multiplication d'un scalaire avec matrice A
A2=lambda*B //multiplication d'un scalaire avec matrice B

cond(A) //Conditionnemenet de la matrice A

//TP7
A=rand(3,3) //Generation d'une matrice A random
xex=rand(3,1) //Generation d'un vecteur colonne xex

b=A*xex //Calcul de b

x=(A \ b) //Calcul de x

norm((xex-x)/xex,2) //Calcul de l'erreur avant
norm(b-A*x,2)/(norm(A,2)*norm(x,2)) //Calcul de l'erreur ariere
