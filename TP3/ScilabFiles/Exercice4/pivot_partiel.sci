//Algorithm 14 Pivot Partiel

function [L,U,P]=mylu(A)

n = size (A,1); //size n

P=eye(n,n); //initialization du matrice P
L=eye(n,n); //initialization du matrice L
U=A; //initialization du matrice U

for k=1:n
    [piv, ind] = max(abs(U(k:n,k))); /// récupère le max piv à la ligne ind du vecteur colonne sous l’élément diagonal A(k,k)

    ind = k-1+ind; //convertit l’indice local en un indice global de la ligne à échanger
  
    if (ind ~= k) then //interchange des lignes ind et k

    //on echange les lignes ind et k dans la matrice U
        new = U(k, :); //stockage temporaire de la ligne a echanger dans le vecteur new
        U(k, :) = U(ind, :);  //echange 
        U(ind, :) = new;


    //on echange les lignes ind et k dans la matrice de permutation P
        new1 = P(k, :); //stockage temporaire de la ligne a echanger dans le vecteur new
        P(k, :) = P(ind, :);  //echange 
        P(ind, :) = new1;

    //On echange les lignes lignes ind et k dans les colonnes 1:k-1 de la matrice L
        if k>=2
            new2 = L(k,1:k-1);
            L(k,1:k-1) = L(ind,1:k-1);
            L(ind,1:k-1) = new2;

        
        end
    end

    for i=k+1:n
     L(i,k)= U(i,k)/U(k,k);
     U(i,:)=U(i,:)-L(i,k)*U(k,:);
    end
end

endfunction
funcprot(0)
