A=[0.5819606, 0.6603468, 0.8009798; 0, 0.5958275, 0.5262907; 0, 0, 0.1496625];//Matrice U obtenue dans l'ex.2, TP3 definie comme matrice A (3*3) de test

b= [0.847947; 0.6737939; 0.3919569]; //vecteur b (3*1)

tic();
[x]=gausskij3b(A,b) //Resolution par elimination de Gauss sans pivotage
disp(toc()); //Temps de calcul
funcprot(0)
