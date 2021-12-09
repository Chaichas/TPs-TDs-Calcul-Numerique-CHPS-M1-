function[L,Lt]= cholesky(A)
// A est symetrique
// Lt= L'

[m n] = size(A); //Dimensions de A
Lt = zeros(m,m); //Initialisation de Lt

for i = 2: m
    Lt(i,i) = sqrt(A(i,i) - Lt(1:i-1,i)' * Lt(1:i-1,i));
    for j = i+1:m
        Lt(i,j) = (A(i,j) - Lt(1:i-1,i)' * Lt(1:i-1,j))/Lt(i,i);
    end
end 
L = Lt';
endfunction
funcprot(0)
