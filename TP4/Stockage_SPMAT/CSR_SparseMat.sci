//Stockage CSR
function [AA,JA,IA]=CSR_SPMat(A)

[m n]=size(A);  //taille de la matrice A (m*n)
[nnz]=NNZ_SPMat(A); //nombre des elements non nuls d'une matrice
AA=zeros(nnz,1); //initialisation du vecteur AA (nnz*1)
JA=zeros(nnz,1); //initialisation du vecteur JA (nnz*1)
IA=zeros(n+1,1); //initialisation du vecteur IA (n+1*1)

k=1; //inialisation du compteur k
    for i=1:m
        for j=1:n
            if (A(i,j)~=0) then //element non nul de A
                AA(k) = A(i,j); //vecteur AA
                JA(k) = j; //%remplissage du vecteur JA: j des elements ~=0 de A
                k=k+1; //incrementation du compteur k
            end
        end
    end

//Remplissage de IA
nnz1=1; //initialisation du compteur
IA(1)=1; //1er element du vecteur IA
IA(n+1)=nnz+1; //Element (n+1) du vecteur IA

    for i=1:m
        for j=1:n
            if (A(i,j)~=0) then //element non nul de A
                nnz1=nnz1+1; //elements non nuls de A
            end
        end
IA(i+1)=nnz1; //Remplissage du vecteur IA par des pointeurs sur les lignes
    end

endfunction
funcprot(0)
