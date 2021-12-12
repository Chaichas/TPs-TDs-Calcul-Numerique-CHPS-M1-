//Comparison entre LDL' et LL'
A=[1,1,1,1;1,5,5,5;1,5,14,14;1,5,14,15]; //matrice A

//Forme standard de LDL'
tic();
[L,d] = LDLFactorisation(A); //Factorisation LDL' ==> d(vecteur des elements diag de D) et L(triang inf)
//
toc(); //Activation du temps
disp(toc()); //Affichage du temps de calcul

err_LDL = norm(A-L*diag(d)*L'); //Calcul de l erreur commise de la factorisation LDL'
disp(err_LDL);


//Factorisation compacte de LDL' (Algo Factorisation_Compacte_LDL')
tic();
[L_LDL_Compacte,d_LDL_Compacte]=LDLFactorisation_Compacte(A); //Factorisation compacte de LDL'
//
toc();
disp(toc()); //Affichage du temps de calcul

err_LDL_Compacte = norm(A-L_LDL_Compacte*diag(d_LDL_Compacte)*L_LDL_Compacte'); //Calcul de l erreur commise de la factorisation compacte LDL
disp(err_LDL_Compacte );



//Algo de Cholesky
tic();
[L_chol] = cholesky(A); //Algo de Cholesky => L(Triang inf)
toc();
disp(toc()); //Affichage du temps de calcul

err_Lchol = norm(A-L_chol*L_chol'); //Calcul de l erreur commise de la factorisation LL'
disp(err_Lchol);
