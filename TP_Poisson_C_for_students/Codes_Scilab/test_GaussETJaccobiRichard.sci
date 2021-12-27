//Calcul de nombre d iterations de Jaccobi et Gauss Seidel
//Test de Richardson

n = 10; //size of the matrix A
T0 = -5; //T0
T1 = 5; //T1
k_max = 10D5; //max iterations
epsilon = 10D-9; //epsilon
[A] = Poisson1DMatric(n); //matrice de poisson 1D

//lambda_max = max(spec(A));
//lambda_min = min(spec(A));
//alpha = 2/(lambda_max + lambda_min); //alpha optimale
alpha= 3.918985939;

[A] = Poisson1DMatric(n); //matrice A
[b] = RHS_vec(n, T0, T1); //vecteur b

[Xk,r,relres,iter]=Jaccobi(A,b, k_max, epsilon); //Jaccobi
disp(iter);

[Xk,r,relres,iter]=gauss_Seidel(A,b, k_max, epsilon); //Gauss
disp(iter);

[Xk,r,relres,iter]=richardson(A,b, k_max, epsilon, alpha); //Richardson
disp(iter);

funcprot(0)
