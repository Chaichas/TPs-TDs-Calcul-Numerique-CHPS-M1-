//Matrice A de Poisson 1D
function [A] = Poisson1DMatric(n)
    A = zeros(n, n); //initiation de la matrice A
    
    A(n,n)=2;
    
    for i = 1:n-1
        A(i,i) = 2;
        A(i + 1, i) = -1;
        A(i, i + 1) = -1;
    end

endfunction 
funcprot(0)
