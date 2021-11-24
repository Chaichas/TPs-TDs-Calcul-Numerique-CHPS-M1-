A= rand(10, 10);
B= rand(10, 5);

//Produit Matrice-Matrice ""ijk"" avec 2 boucles (Alg8)
function[C]=matmat2b(A, B)
[m p] = size(A) 
[p n] = size(B) 

tic();
for i = 1:m
    for j = 1:n
            C(i,j)=A(i,)*B(:,j)+C(i,j);
    end
end
toc();
endfunction
