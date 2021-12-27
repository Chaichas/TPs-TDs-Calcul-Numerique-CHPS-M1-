//Methode iterative de Gauss Seidel
//M = D-E
function [Xk,r,relres,iter]=gauss_Seidel(A,b, k_max, epsilon)
    n = size(A,1); //taille de A
    E = zeros (n,n); //initialization de E
    Xk = zeros(n,1); //initialisation de Xk

    D= diag(diag(A)); //matrice D diagonale
    E=-tril(A,-1); //matrice E
    M = inv(D-E); //M = inv(D-E)

    iter=0; //compteur
    r =  b - A * Xk; //initialisation residu
    relres= norm(r)/norm(b); //erreur residuelle
    
    while (relres>epsilon) && (iter< k_max) do
        Xk = Xk + M * r; //Richardson
        r = b - A * Xk; //Residu
        iter = iter+1; //incrementation du compteur
        relres = norm(r)/norm(b); //erreur residuelle
    end
endfunction
funcprot(0)
