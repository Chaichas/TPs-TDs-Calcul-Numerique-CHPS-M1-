//Test de l'algorithme de resolution par elimination de Gauss sans pivotage

A=rand(50,50); //Matrice A
xg=rand(50,1); //vecteur xg 3*1
b=A*xg;

//Temps de calcul
tic();
[x]=gausskij3b(A,b) //Resolution par elimination de Gauss sans pivotage
disp(toc());

//Erreurs avant et arriere

err=norm((xg-x)/xg,2); //Calcul de l'erreur avant
relres=norm(b-A*x,2)/(norm(A,2)*norm(x,2)); //Calcul de l'erreur ariere
disp(err);
disp(relres);

funcprot(0)
