//Test de l'algorithme du pivot partiel

A=rand(50,50); //Matrice A

tic();
[L,U,P]=mylu(A);
toc();
disp(toc()); //display le temps de calcul

//disp(L); //Display la matrice L
//disp(U); //Display la matrice U
//disp(P); //Display la matrice P

//Verification des resultats
T1= L*U;
T2=P*A;

//disp(T1); //Display le produit matriciel L*U
//disp(T2); //Display le produit matriciel P*A

//Validation en utilisant la fonction lu() de Scilab
tic();
[L1,U1,P1]= lu(A);
toc();
disp(toc());

//disp(L1);
//disp(U1);
//disp(P1);

err1 = norm(L-L1); //calcul d'erreur entre L de l'algo et L1 de Scilab
err2 = norm(U-U1); //calcul d'erreur entre U de l'algo et U1 de Scilab
err3 = norm(P-P1); //calcul d'erreur entre P de l'algo et P1 de Scilab

disp(err1);
disp(err2);
disp(err3);

funcprot(0)
