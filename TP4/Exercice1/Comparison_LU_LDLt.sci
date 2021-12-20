1//Exemple de Test (cas matrice A 3*3)

//Factorisation LDL' (Algo Factorisation_LDL')
W = rand(1000,1000); //Matrice qlq construite a partir de la fonction random
A = W*W'; //Matrice A symetrique construite a partir de w et son transposee
disp(cond(A))

//Comparison ==> Factorisation LU (Algo standard)
tic();
[L_LU,U_LU] = mylu3b(A); //Algo de factorisation LU
toc();  

err_LU = norm(A-L_LU*U_LU); //Calcul de l erreur commise de la factorisation LU
disp(err_LU);


tic();
[L,d] = LDLFactorisation(A); //Factorisation LDL' ==> d(vecteur des elements diag de D) et L(triang inf)
//
toc(); //Activation du temps

err_LDL = norm(A-L*diag(d)*L'); //Calcul de l erreur commise de la factorisation LDL'
disp(err_LDL);
