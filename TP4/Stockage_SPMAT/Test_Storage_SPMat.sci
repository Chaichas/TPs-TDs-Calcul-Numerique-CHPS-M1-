//Test des formats de stockage d'une matrice creuse: COO, CSR et CSC

A=[1,2,0,11,0;0,3,4,0,0;0,5,6,7,0;0,0,0,8,0;0,0,0,9,10]; //matrice A(5*5)

//Stockage COO
[AA_COO,JA_COO,IA_COO]=COO_SPMat(A); //COO
disp(AA_COO); //Display AA
disp(JA_COO); //Display JA
disp(IA_COO); //Display IA
//Stockage COO dans Scilab
//Pour tester le stockage COO on utilise space(A) --> format(JA(i),IA(i),AA(i))
D=sparse(A); //(JA(i),IA(i),AA(i)) --> Algo validated
//On peut aussi utiliser [ij,AA_COO1,mn]=spget(D), ou D est une matrice creuse de A
[ij,AA_COO1,mn]=spget(D);


//Stockage CSR
[AA_CSR,JA_CSR,IA_CSR]=CSR_SPMat(A); //CSR
disp(AA_CSR); //Display AA
disp(JA_CSR); //Display JA
disp(IA_CSR); //Display IA

//Stockage CSC
[AA_CSC,JA_CSC,IA_CSC]=CSC_SPMat(A); //CSC
//disp(AA_CSC); //Display AA
//disp(JA_CSC); //Display JA
//disp(IA_CSC); //Display IA

//Test avec Scilab de CSC
B=sparse(A);
[IA_CSC1,JA_CSC1,AA_CSC1]=sp2adj(B);
//disp(AA_CSC1); //Display AA
//disp(JA_CSC1); //Display JA
//disp(IA_CSC1); //Display IA

//Erreurs entre l'algo CSC et Scilab:
Err_AA = norm(AA_CSC-AA_CSC1); //Erreur entre AA de l'algo implemente et Scilab
Err_JA = norm(JA_CSC-JA_CSC1); //Erreur entre JA de l'algo implemente et Scilab
Err_IA = norm(IA_CSC-IA_CSC1); //Erreur entre IA de l'algo implemente et Scilab
disp(Err_AA); //Erreur =0 --> Algo validated
disp(Err_JA); //Erreur =0 --> Algo validated
disp(Err_IA); //Erreur =0 --> Algo validated

A1=[1,2,0,11,0;0,3,4,0,0;0,5,6,7,0]; //matrice A(5*3)
[AA_COO,JA_COO,IA_COO]=COO_SPMat(A1); //COO
[AA_CSR,JA_CSR,IA_CSR]=CSR_SPMat(A1); //CSR
[AA_CSC,JA_CSC,IA_CSC]=CSC_SPMat(A1); //CSC
