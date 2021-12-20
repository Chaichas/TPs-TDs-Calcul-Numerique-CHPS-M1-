1//Exemple de Test (cas matrice A 3*3)

//Factorisation LDL' (Algo Factorisation_LDL')
W = rand(3,3); //Matrice qlq construite a partir de la fonction random
A = W*W'; //Matrice A symetrique construite a partir de w et son transposee

tic(); //Activation du temps
[L,d] = LDLFactorisation(A); //Factorisation LDL' ==> d(vecteur des elements diag de D) et L(triang inf)
//
toc();
disp(toc()); //Affichage du temps de calcul
//disp(L); //Affichage de L (Matrice triangulaire inferieure)
//disp(d); //vecteur d ==> on peut aussi construire la matrice diagonale

D = diag(d); //Matrice D diagonale construite a partir des elements du vecteur colonne d
//disp(D); //Affichage de D

err_LDL = norm(A-L*D*L'); //Calcul de l erreur commise de la factorisation LDL'
disp(err_LDL);

//Factorisation compacte de LDL' (Algo Factorisation_Compacte_LDL')
tic();
[L_LDL_Compacte,d_LDL_Compacte]=LDLFactorisation_Compacte(A); //Factorisation compacte de LDL'
//
toc();
disp(toc()); //Affichage du temps de calcul
D_LDL_Compacte = diag(d_LDL_Compacte); //Matrice D diagonale a partir du vecteur D_LDL_Compacte

err_LDL_Compacte = norm(A-L_LDL_Compacte*D*L_LDL_Compacte'); //Calcul de l erreur commise de la factorisation compacte LDL'
disp(err_LDL_Compacte);


//Plots
subplot(1,2,1)

n=[3,5,10,15,20,40,60,80,100,1000]; //taille n de la matrice A
Err_Standard = [5.55D-17,2.220D-16,1.227D-15 , 2.381D-15 , 3.626D-15, 1.184D-14, 5.861D-14, 8.540D-14 , 8.869D-14 , 1.411D-11]; //erreur de la forme standard

Err_Compacte = [5.55D-17,2.220D-16,1.227D-15 , 2.381D-15 , 3.626D-15, 1.184D-14, 5.861D-14, 8.540D-14 , 8.869D-14 , 1.411D-11]; //erreur de la forme compacte

plot("nlnlnl",n,Err_Standard,'m*-.',n,Err_Compacte); 

legend(["Erreur de la forme standard","Erreur de la forme compacte"],"in_upper_left")
title("Erreur de factorisation")
xlabel("Taille de matrice (n)")
ylabel("Erreurs de factorisation LDLt")


subplot(1,2,2)
n=[3,5,10,15,20,40,60,80,100,1000]; //taille n de la matrice A
t_standard=[0.000115,0.000154,0.000264,0.000393, 0.000515,0.001736 ,0.0030800,0.006853,0.0115390,5.090209];
t_compacte=[0.000081 ,0.0001050,0.00023,0.000307,0.000462 ,0.001527,0.0027040,0.0049450,0.0068600,1.3096240];

plot("nlnlnl",n,t_standard,'m*-.',n,t_compacte); 

legend(["Temps de calcul de la forme standard","Temps de calcul de la forme compacte"],"in_upper_left")
title("Temps de calcul")
xlabel("Taille de matrice (n)")
ylabel("Temps de calcul des algorithmes (s)")

