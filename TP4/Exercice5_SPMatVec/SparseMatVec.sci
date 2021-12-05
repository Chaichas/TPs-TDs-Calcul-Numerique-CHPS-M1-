//A partir du stockage COO, on calcule: y=A*x

function [y]= COO_SPMatVec(A,x)

[m n]= size(A); //dimensions de la matrice A(m,n)
y=zeros(m,1); //initialisation du vecteur y

//Appel des fonctions NNZ_SPMat et COO_SPMat
[nnz]=NNZ_SPMat(A); //Fonction qui calcule nnz, le nombre des elements non nuls de la matrice A
[AA,JA,IA]=COO_SPMat(A); //Fonction qui calcule AA, JA, IA du stockage COO

for i=1:nnz
    y(JA(i)) = y(JA(i))+AA(i)*x(IA(i)); //Calcul de y=A*x
end

endfunction
funcprot(0)
