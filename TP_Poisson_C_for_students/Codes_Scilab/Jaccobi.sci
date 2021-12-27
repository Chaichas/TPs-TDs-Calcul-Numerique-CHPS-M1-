//Methode iterative de Jaccobi
function [Xk,r,relres,iter]=Jaccobi(A,b, k_max, epsilon)
    n = size(A,1); //taille de A 
    Xk = zeros(n,1); //initialisation de Xk

    D= inv(diag(diag(A))); //matrice D diagonale

    iter=0; //compteur
    r = b- A * Xk; //initialisation residu    
    relres = norm(r)/norm(b); //erreur residuelle
    
    while (relres>epsilon) && (iter< k_max) do
        Xk = Xk + D * r; //Richardson avec M=D
        r = b - A * Xk; //Residu
        iter = iter+1; //incrementation du compteur
        relres = norm(r)/norm(b); //erreur residuelle
    end

endfunction
funcprot(0)
