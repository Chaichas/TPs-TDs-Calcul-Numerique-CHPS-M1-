//Produit Matrice-Matrice ""ijk"" avec 1 boucle (Alg9)
function[C]=matmat1b(A, B)
[m p] = size(A) 
[p n] = size(B) 
C=zeros(m,n);

tic();
for i = 1:m
            C(i,:)=A(i,:)*B+C(i,:);
end
toc();
endfunction
