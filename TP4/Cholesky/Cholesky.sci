function [L,d]=cholesky(A)
//A= matrice symetrique definie positive
//si on a W qlq, on fait: A=W*W'

n=size(A,1); //taille de la matrice A
L=zeros(n,n); //Initialisation de la matrice L 
v=zeros(n,1); //Initialisation du vecteur v
d=zeros(n,1) //D= diag(d(i))


for j=2:n //boucle sur les colonnes
    
    for i=1:j-1 //boucle sur les lignes
        v(i)= L(j,i)*d(i);  
    end
    d(j)= A(j,j)-L(j,1:j-1)*v(1:j-1);
    L(j+1:n,j)=(A(j+1:n,j)-L(j+1:n, 1:j-1)*v(1:j-1) )/d(j);
end
endfunction
funcprot(0)
