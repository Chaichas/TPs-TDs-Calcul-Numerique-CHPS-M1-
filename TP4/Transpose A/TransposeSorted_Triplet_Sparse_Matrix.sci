// Extract Triplet from matrix A
function [tripletInvSort]=SortedInverseTriplet(triplet)

nnz = size(triplet,1); //nnz= nombre des elements non nuls de la matrice triplet
temp = zeros(nnz,3); //initialisation de temp

//Transpose de la matrice Triplet
    for i=1:nnz
        for j=1:3
            temp = triplet(i,1);
            triplet(i,1)=triplet(i,2); //inverser les colonnes 1 et 2
            triplet(i,2)=temp; //triplet(i,2)=triplet(i,1)
        end
    end

//Sorting du Transpose de la matrice Triplet
max= triplet(1,1); //inialisation de la valeur max de triplet
    for i=1:(nnz-1)
            if (triplet(i,1) < triplet(i+1,1)) then
                max = triplet(i+1,1); //Recherche de la valeur max de triplet
            end
    end
k=1;
    for i=1:max
        for j=1:nnz
            if(triplet(j,1)==i) then
                tripletInvSort(k,1) = triplet(j,1); //sorting ligne1
                tripletInvSort(k,2) = triplet(j,2); //sorting ligne2
                tripletInvSort(k,3) = triplet(j,3); //sorting ligne3
                k=k+1;
            end
        end
    end

endfunction
funcprot(0)
