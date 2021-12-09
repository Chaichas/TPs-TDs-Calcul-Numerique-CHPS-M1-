//A partir du stockage CSR, on calcule: y=A*x

function [y]= CSR_SPMatVec(A,x)

[m n] = size(A); //Taille de la matrice A (m,n)
y = zeros(m,1); //initialisation du vecteur y
[AA,JA,IA]=CSR_SPMat(A); //appel a l'algo de stockage CSR

for i = 1:m-1
  for j=IA(i):IA(i+1)-1
    y(i) = y(i) + AA(j)*x(JA(j)); //vecteur y produit de la matrice creuse A et du vecteur x
  end 
end
    y(m) = y(m) + AA(IA(m))*x(JA(m)); //valeur m du vecteur y
endfunction
funcprot(0)
