//Stockage CSC
function [AA,JA,IA]=CSC_SPMat(A)

[m n]=size(A);  //taille de la matrice A (m*n)
[nnz]=NNZ_SPMat(A); //nombre des elements non nuls d'une matrice
AA=zeros(nnz,1); //initialisation du vecteur AA
JA=zeros(nnz,1); //initialisation du vecteur JA
IA=zeros(m+1,1); //initialisation du vecteur IA

nnz1=1;
k=1;
IA(1)=1; //1er element du vecteur IA
IA(n+1)=nnz+1; //Element (n+1) du vecteur IA
    for j=1:n
        for i=1:m
            if (A(i,j)~=0) then
                AA(k) = A(i,j); //vecteur AA
                JA(k) = i; //vecteur JA
                k=k+1;
                nnz1=nnz1+1;
            end
        end
IA(j+1)= nnz1; //Remplissage du vecteur IA par des pointeurs sur les colonnes
    end

endfunction
funcprot(0)
