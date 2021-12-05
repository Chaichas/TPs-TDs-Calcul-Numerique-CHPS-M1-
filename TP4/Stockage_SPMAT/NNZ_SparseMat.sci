//Calcul des elements non nuls d'une matrice creuse A
function [nnz]=NNZ_SPMat(A)
[m n]=size(A); //taille de la matrice creuse A(m*n)
nnz = 0; //nnz= elements non nuls de la matrice creuse A

    for i=1:m
        for j=1:n
            if (A(i,j)~=0) then
                nnz = nnz+1; //incrementation du nombre des elements non nuls de A
            end
        end
    end

endfunction
funcprot(0)
