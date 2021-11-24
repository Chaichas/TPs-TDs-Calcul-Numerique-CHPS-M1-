A= rand(10, 10);
B= rand(10, 5);

//Produit Matrice-Matrice ""ijk"" avec 1 boucle (Alg9)
function[C]=matmat1b(A, B)
[m p] = size(A) 
[p n] = size(B) 

tic();
for i = 1:m
            C(i,:)=A(i,:)*B+C(i,:);
end
toc();
endfunction
