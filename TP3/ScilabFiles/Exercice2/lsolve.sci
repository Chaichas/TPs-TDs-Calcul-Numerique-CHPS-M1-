/*Méthode de descente : résolution de Lx = b (version avec
produit scalaire)*/

function[x]=lsolve(L,b) //L: Matrice triangulaire supérieure
 
 n = size(b)(1) //n= longueur du 1er element du vecteur b
 x=zeros(n, 1);

    x(1)=b(1)/L(1, 1);

    for i = 2:n
      x(i)=(b(i)-L(i, 1:(i-1))*x(1:(i-1)))/L(i,i);
    end

endfunction
funcprot(0)
