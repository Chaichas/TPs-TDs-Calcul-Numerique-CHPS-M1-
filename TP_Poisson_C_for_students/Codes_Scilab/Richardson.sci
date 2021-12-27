//Methode de Richardson
function [Xk,r,relres,iter]=richardson(A,b, k_max, epsilon, alpha)
    n = size(A,1); //taille de A
    Xk = zeros(n,1); //initialisation de Xk

    iter=0; //compteur
    r =  b - A * Xk; //initialisation residu
    relres= norm(r)/norm(b); //erreur residuelle
    
    while (relres>epsilon) && (iter< k_max) do
        Xk = Xk + alpha * r; //Richardson
        r = b - A * Xk; //Residu
        iter = iter+1; //incrementation du compteur
        relres = norm(r)/norm(b); //erreur residuelle
    end
endfunction
funcprot(0)
