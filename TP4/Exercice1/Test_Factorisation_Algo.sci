1//Exemple de Test (cas matrice A 3*3)

//Factorisation LDL' (Algo Factorisation_LDL')
W = rand(1000,1000); //Matrice qlq construite a partir de la fonction random
A = W*W'; //Matrice A symetrique construite a partir de w et son transposee


tic();
[L,d] = LDLFactorisation(A); //Factorisation LDL' ==> d(vecteur des elements diag de D) et L(triang inf)
//
toc(); //Activation du temps
disp(toc()); //Affichage du temps de calcul
//disp(L); //Affichage de L (Matrice triangulaire inferieure)
//disp(d); //vecteur d ==> on peut aussi construire la matrice diagonale

//D = diag(d); //Matrice D diagonale construite a partir des elements du vecteur colonne d
//disp(D); //Affichage de D

err_LDL = norm(A-L*diag(d)*L'); //Calcul de l erreur commise de la factorisation LDL'
disp(err_LDL);




//Factorisation compacte de LDL' (Algo Factorisation_Compacte_LDL')
tic();
[L_LDL_Compacte,d_LDL_Compacte]=LDLFactorisation_Compacte(A); //Factorisation compacte de LDL'
//
toc();
disp(toc()); //Affichage du temps de calcul

//D_LDL_Compacte = diag(d_LDL_Compacte); //Matrice D diagonale a partir du vecteur D_LDL_Compacte

err_LDL_Compacte = norm(A-L_LDL_Compacte*diag(d_LDL_Compacte)*L_LDL_Compacte'); //Calcul de l erreur commise de la factorisation compacte LDL'
disp(err_LDL_Compacte);






//Comparison ==> Factorisation LU (Algo standard)
tic();
[L_LU,U_LU] = mylu3b(A); //Algo de factorisation LU
toc();
disp(toc()); //Affichage du temps de calcul

//disp(L_LU); //affichage du matrice triangulaire inferieure de LU
//disp(U_LU); //affichage du matrice triangulaire superieure de LU
err_LU = norm(A-L_LU*U_LU); //Calcul de l erreur commise de la factorisation LU
disp(err_LU);





//Comparison ==> Factorisation LU (Algo optimise)
//tic();
//[L_LUopt,U_LUopt]=mylu1b(A); //Algo de factorisation LU optimise
//toc();
//disp(toc()); //Affichage du temps de calcul

//disp(L_LUopt); //affichage du matrice triangulaire inferieure de LU optimise
//disp(U_LUopt); //affichage du matrice triangulaire superieure de LU optimise
//err_LUopt = norm(A-L_LUopt*U_LUopt); //Calcul de l erreur commise de la factorisation LU optimise
//disp(err_LUopt);




//Factorisation LL'(Algo de Cholesky)

//Il faut definir une matrice A1/ A1 est une matrice symetrique positive!!!
//A1=[4,12,-16;12,37,-43;-16,-43,98]; //exemple de matrice sym def positive
//A1=[10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8];
//A1=[1,1,1,1;1,5,5,5;1,5,14,14;1,5,14,15]; //matrice A sym def positive in 4*4
//tic();
//[L_chol] = cholesky(A1); //Algo de Cholesky => L(Triang inf)
//toc();
//disp(toc()); //Affichage du temps de calcul
//disp(L_chol); //affichage du matrice triangulaire inferieure
//err_Lchol = norm(A1-L_chol*L_chol'); //Calcul de l erreur commise de la factorisation LL'

//Validation de LL' avec Scilab: https://help.scilab.org/docs/6.1.0/fr_FR/chol.html
//chol(A1)'; //Fonction Cholesky de Scilab ==> Transp(chol)=L
//disp(chol(A1)');

//norm(L_chol*L_chol'-chol(A1)') //Calcul d'erreur de factorisation commise sur l'algo LL'
