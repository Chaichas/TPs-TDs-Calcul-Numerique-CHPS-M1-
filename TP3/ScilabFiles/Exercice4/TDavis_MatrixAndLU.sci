//Sparse Matrix
umfdir = fullfile(SCI,"modules","umfpack","examples");
filename = fullfile(umfdir,"arc130.rua");
[C] = ReadHBSparse(SCI+"/modules/umfpack/demos/arc130.rua");

//Converting the sparse matrix to a full one
A = full(C)

//Methode de Pivot Partiel
[L,U,P]=mylu(A)

funcprot(0)
