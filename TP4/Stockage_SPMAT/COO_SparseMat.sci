//Stockage COO
function [AA,JA,IA]=COO_SPMat(A)

[m n]=size(A);  //taille de la matrice A (m*n)
[nnz]=NNZ_SPMat(A); //nombre des elements non nuls d'une matrice
AA=zeros(nnz,1); //initialisation du vecteur AA
JA=zeros(nnz,1); //initialisation du vecteur JA
IA=zeros(nnz,1); //initialisation du vecteur IA

k=1;
    for i=1:m
        for j=1:n
            if (A(i,j)~=0) then
                AA(k) = A(i,j);
                JA(k) = i;
                IA(k) = j;
                k=k+1;
            end
        end
    end

endfunction
funcprot(0)
