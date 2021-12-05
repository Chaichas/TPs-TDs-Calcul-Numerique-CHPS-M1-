//Test, TP4, exercice 4
//Matrice A de lexercice 4
A=[15,0,0,22,0,-15,0,0;0,11,3,0,0,0,2,0;0,0,0,-6,0,0,0,0;0,0,0,0,0,0,0,0;91,0,0,0,0,0,25,7;0,0,28,0,0,0,0,-2];

[triplet]=Triplet(A); //Triplet de la matrice A
disp(triplet); //display le triplet de la matrice A

tic();
[tripletInvSort]=SortedInverseTriplet(triplet); //Inverse Triplet organise de la matrice A
toc();
disp(toc());
disp(tripletInvSort); //display tripletInvSort
 
//Validation avec Scilab --> Validated
A1=sparse (A); //obtention de la matrice creuse a partir de A
At=A1'; //Tranposee de la matrice creuse A
disp(At); //Display Tranposee de la matrice creuse A

funcprot(0)
