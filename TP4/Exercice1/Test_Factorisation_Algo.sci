1//Exemple de Test (cas matrice A 3*3)

//Factorisation LDL' (Algo Factorisation_LDL')
W = rand(3.3); //Matrice qlq construite a partir de la fonction random
A = W*W'; //Matrice A symetrique construite a partir de w et son transposee

tic();
[L,D] = LDLFactorisation(A); //Factorisation LDL' ==> D(diag) et L(triang inf)
toc();
disp(toc()); //Affichage du temps de calcul
disp(L); //Affichage de L (Matrice triangulaire inferieure)
disp(D); //vecteur D ==> on peut aussi construire la matrice diagonale

D1 = diag(D); //Matrice D1 diagonale construite a partir des elements du vecteur D
disp(D1); //Affichage de D1
err_LDL = norm(A-L*D1*L'); //Calcul de l erreur commise de la factorisation LDL'

//Factorisation compacte de LDL' (Algo Factorisation_Compacte_LDL')
tic();
[L_LDL_Compacte,D_LDL_Compacte]=LDLFactorisation_Compacte(A); //Factorisation compacte de LDL'
toc();
disp(toc()); //Affichage du temps de calcul
D2 = diag(D_LDL_Compacte); //Matrice D2 diagonale a partir du vecteur D_LDL_Compacte
err_LDL_Compacte = norm(A-L_LDL_Compacte*D2*L_LDL_Compacte'); //Calcul de l erreur commise de la factorisation compacte LDL'

//Factorisation LL'(Algo de Cholesky)

//Il faut definir une matrice A1/ A1 est une matrice symetrique positive!!!
tic();
[L_chol] = cholesky(A1); //Algo de Cholesky => L(Triang inf)
toc();
disp(toc()); //Affichage du temps de calcul
disp(L_chol); //affichage du matrice triangulaire inferieure
err_Lchol = norm(A1-L_chol*L_chol'); //Calcul de l erreur commise de la factorisation LL'

//Validation de LL' avec Scilab: https://help.scilab.org/docs/6.1.0/fr_FR/chol.html
chol(A1)'; //Fonction Cholesky de Scilab ==> Transp(chol)=L
disp(chol(A1)');

norm(L_chol*L_chol'-chol(A1)') //Calcul d'erreur de factorisation commise sur l'algo LL'

//Comparison ==> Factorisation LU (Algo standard)
tic();
[L_LU,U_LU] = mylu3b(A); //Algo de factorisation LU
toc();
disp(toc()); //Affichage du temps de calcul
disp(L_LU); //affichage du matrice triangulaire inferieure de LU
disp(U_LU); //affichage du matrice triangulaire superieure de LU
err_LU = norm(A-L_LU*U_LU); //Calcul de l erreur commise de la factorisation LU

//Comparison ==> Factorisation LU (Algo optimise)
tic();
[L_LUopt,U_LUopt]=mylu1b(A); //Algo de factorisation LU optimise
toc();
disp(toc()); //Affichage du temps de calcul
disp(L_LUopt); //affichage du matrice triangulaire inferieure de LU optimise
disp(U_LUopt); //affichage du matrice triangulaire superieure de LU optimise
err_LUopt = norm(A-L_LUopt*U_LUopt); //Calcul de l erreur commise de la factorisation LU optimise
