//Calcul de nombre d iterations de Jaccobi et Gauss Seidel

n = 3; //size of the matrix A
T0 = -5; //T0
T1 = 5; //T1
k_max = 10D5; //max iterations
epsilon = 10D-2; //epsilon

[A] = Poisson1DMatric(n); //matrice A
[b] = RHS_vec(n, T0, T1); //vecteur b

[Xk,r,relres,iter]=Jaccobi(A,b, k_max, epsilon); //Jaccobi
disp(iter);

[Xk,r,relres,iter]=gauss_Seidel(A,b, k_max, epsilon); //Gauss
disp(iter);

funcprot(0)
