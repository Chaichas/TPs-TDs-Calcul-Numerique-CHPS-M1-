/*Alg10: Méthode de remontée : résolution de Ux = b (version avec
produit scalaire)*/

function[x]=usolve(U,b) //U: Matrice triangulaire supérieure 

 n = size(b)(1) //n= longueur du 1er element du vecteur b
 x=zeros(n, 1); //initialisation du vecteur x

    x(n)=b(n)/U(n, n);

    for i = n-1:-1 : 1
         x(i)=(b(i)-U(i,(i+1):n)*x((i+1):n))/U(i,i);
    end

endfunction
funcprot(0)
