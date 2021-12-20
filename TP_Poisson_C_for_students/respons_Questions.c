EX3:

2/ LAPACK COL MAJOR
https://stackoverflow.com/questions/34698550/understanding-lapack-row-major-and-lapack-col-major-with-lda

LAPACK_{ROW,COL}_MAJOR is used by LAPACKE (the C interface to LAPACK) to determine whether the block of memory you are passing (via a pointer in C) is referencing memory that is organized by row major (all of one row comes before the next row) or column major (all of one column comes before the next column). Also note that these ideas generalize (for more than 2D arrays) with row --> "outer most dimension" and col --> "inner most dimension".

One added note: C uses row-major storage and Fortran uses col-major storage. When talking between the two systems, you need to either translate or be happy working with a transpose. 
 
 
 
 3/ **Leading dimension:
The leading dimension for a two-dimensional array is an increment that is used to find the starting point for the matrix elements in each successive column of the array. 
https://www.ibm.com/docs/en/essl/6.3?topic=matrices-how-leading-dimension-is-used




4/http://www.netlib.org/lapack/explore-html/d3/d49/group__double_g_bsolve_gafa35ce1d7865b80563bbed6317050ad7.html

 DGBSV computes the solution to a real system of linear equations
 A * X = B, where A is a band matrix of order N with KL subdiagonals
 and KU superdiagonals, and X and B are N-by-NRHS matrices.

 The LU decomposition with partial pivoting and row interchanges is
 used to factor A as A = L * U, where L is a product of permutation
 and unit lower triangular matrices with KL subdiagonals, and U is
 upper triangular with KL+KU superdiagonals.  The factored form of A
 is then used to solve the system of equations A * X = B.
 
 
 
 **** On resoud un systeme lineaire Ax=B
 ie: A LHS = R RHS
 l ou ld --> leading dimension
 
 
 
 
