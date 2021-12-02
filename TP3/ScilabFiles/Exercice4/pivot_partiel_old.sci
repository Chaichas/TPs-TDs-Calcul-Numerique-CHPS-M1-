//Algorithm 14 Pivot Partiel

function [L,U,P]=mylu(A)

n = size (A,1); //size n

P=eye(n,n); //initialization du matrice P
L=eye(n,n); //initialization du matrice L
U=A; //initialization du matrice U

for k=1:n
    [piv, ind] = max(abs(U(k:n,k))); /// récupère le max piv à la ligne ind du vecteur colonne sous l’élément diagonal A(k,k)

    ind = k-1+ind; //convertit l’indice local en un indice global de la ligne à échanger
    q = row(1,ind);
  
    if (ind ~= k) then
    //on echange les lignes ind et k dans la matrice U
        new = U(ind, :); //stockage temporaire de la ligne a echanger dans le vecteur new
        U(ind, :)= U(k, :);  //echange

        row(1, ind) = row(1, k); //mise a jour du vecteur des permutations
        row(1:k)=q; //mise a jour du vecteur des permutations, q est la ligne a permuter
    end

    for i=k+1:n
     L(i,k)= U(i,k)/U(k,k);
     U(i,:)=U(i,:)-L(i,k)*U(k,:);
    end
end
disp(L); //Display la matrice L
disp(U); //Display la matrice U

//Verification des resultats
T1= L*U;
T2=P*A;
disp(T1); //Display l produit matriciel L*U
disp(T2); //Display l produit matriciel P*A

endfunction
funcprot(0)
