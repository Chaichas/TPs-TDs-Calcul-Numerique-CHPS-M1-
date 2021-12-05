// Extract Triplet from matrix A
function [triplet]=Triplet(A)

[m n]=size(A); //taille de la matrice A (m*n)
nnz = 0; //nnz= elements non nuls de la matrice A

    for i=1:m
        for j=1:n
            if (A(i,j)~=0) then //condition: element non nul de la matrice A
                nnz = nnz+1; //nombre des elements non nuls augmente de 1
                triplet(nnz,1) = i; //1ere colonne de triplet (indices i des lignes)
                triplet(nnz,2) = j; //2eme colonne de triplet (indices j des colonnes)
                triplet(nnz,3) = A(i,j); //3eme colonne de triplet (elements non nuls de la matrice A)
            end
        end
    end

endfunction
funcprot(0)
