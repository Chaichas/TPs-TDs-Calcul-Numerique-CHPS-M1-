/******************************************/
/* tp2_poisson1D_direct.c                 */
/* This file contains the main function   */
/* to solve the Poisson 1D problem        */
/******************************************/
#include "lib_poisson1D.h"
int main(int argc,char *argv[])
//recoupier des tabls coute plus cher que passer l adresse du tab
/* ** argc: Number of arguments */
/* ** argv: Values of arguments */
{
  //Variables definition
  int ierr;
  int jj;
  int nbpoints, la; //la ==> n
  int ku, kl, kv, lab, lab1;
  int *ipiv;
  int info;
  int NRHS;
  int INCX, INCY;
  int alpha, beta;
  double T0, T1; //Dirichlet Boundary Conditions
  double *RHS, *B, *EX_SOL, *X, *Y; //pointeurs (Tableaux)
  /* RHS = B;
  EX_SOL = Solution exacte;
  X = Solution approchee (systeme: A * X = B)
  */
  double *AB, *CB, *DB; //tab de stockage

  double temp, relres; //erreur relative residuelle

  NRHS=1; //Nombre de colonnes de B
  nbpoints=102; // points de discretisation: de x(0) a x(n+1), donc n=100
  la=nbpoints-2; // =n, without boundary conditions: T0 et T1
  T0=-5.0; //Dirichlet boundary condition T0 (left)
  T1=5.0; //Dirichlet boundary condition T1 (right)
  
  //var utilises dans dgbmv
  INCX = 1; //stride within X
  INCY = 1; //stride within Y
  alpha = 1.0; //Scalar before X
  beta = 0.0; //Scalar before Y

  printf("--------- Poisson 1D ---------\n\n");
  
  //Memory allocation with malloc
  RHS=(double *) malloc(sizeof(double)*la);  //second membre de taille la*1
  B=(double *) malloc(sizeof(double)*la); //A * X = B (second membre pour test dgbmv)
  EX_SOL=(double *) malloc(sizeof(double)*la); //solution exacte analytique de taille la*1
  X=(double *) malloc(sizeof(double)*la); //vecteur X des inconnus, de taille la*1
  Y=(double *) malloc(sizeof(double)*la); 

  set_grid_points_1D(X, &la); //valeurs du grid de x(1) a x(n)
  //set_dense_RHS_DBC_1D() ==> source g =0 et vec(0) = T0, vec(la) = T1 
  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1); //source g =0
  set_dense_RHS_DBC_1D(B,&la,&T0,&T1); // A X = B
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1); //solution analytiqye
  
  //Ecriture des vecteurs dans des fichiers ".dat"
  write_vec(RHS, &la, "RHS.dat"); //remplissage du fichier "RHS.dat"
  write_vec(EX_SOL, &la, "EX_SOL.dat"); //remplissage du fichier "EX_SOL.dat"
  write_vec(X, &la, "X_grid.dat"); //remplissage du fichier "X_grid.dat"
  write_vec(B, &la, "B.dat"); //remplissage du fichier "RHS.dat"
  //write_vec(Y, &la, "Y.dat"); //remplissage du fichier "Y.dat"

  //Dimension du probleme
  kv=1; //Kv = 1: indice dans la bibliotheque Laplack lie a dgbtrs dgbt
  //if kv = 0 --> On entry to DGBSV parameter number  6 had an illegal value
  ku=1; //Upper diagonale (sur-diagonale)
  kl=1; //Lower diagonale (sous-diagonale)
  lab=kv+kl+ku+1; 

  //Compact storage of A: AB is a 2D array of doubles, having a dim of lab * la
  AB = (double *) malloc(sizeof(double)*lab*la); //stockage de la matrice tidiagonale bande A dans le tableau AB de double de taille lab*la
  //CB = (double *) malloc(sizeof(double)*(lab-1)*la); //for dgbmv row_major
  //DB = (double *) malloc(sizeof(double)*(lab-1-kv)*la); //for dgbmv col_major
 
  info=0; //indique l'existence d une solution de dgbsv
 
  /* working array for pivot used by LU Factorization */
  
  //Memory allocation, where ipiv is the pivot array
  ipiv = (int *) calloc(la, sizeof(int)); //tableau de int de taille la, contenant les elements de pivot ==> initialise a 0

  int row = 0; //0 pour LAPACK_COL_MAJOR, et 1 pour LAPACK_ROW_MAJOR

  if (row == 1){ // LAPACK_ROW_MAJOR  
  
    set_GB_operator_rowMajor_poisson1D(AB, &lab, &la);
    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "AB_row.dat");
    
    // LAPACK_dgbsv(AB, &lab, &la, "AB_row.dat"); 
    
    info = LAPACKE_dgbsv(LAPACK_ROW_MAJOR,la, kl, ku, NRHS, AB, la, ipiv, RHS, NRHS);
    
   
    // Fonction DGBMV de BLAS ==> MAT-VEC for ROW_Major  
    // ==> DGMV ne marche pas pour ROW_Major   
     
   //kv = 0;
   //lab1 = lab -1; 
   //CB = (double *) malloc(sizeof(double)*(lab1)*la); //for dgbmv row_major
   //set_GB_operator_rowMajor_poisson1D(CB, &lab1, &la);
   //write_GB_operator_rowMajor_poisson1D(CB, &lab1, &la, "CB_row.dat");
   
   //cblas_dgbmv(CblasRowMajor, CblasNoTrans, la, la, kl, ku, alpha, CB, lab1, EX_SOL, INCX, beta, Y, INCY);
   
   //write_vec(Y, &la, "Y.dat"); //remplissage du fichier "Y.dat"
  
  }
  
  else { // LAPACK_COL_MAJOR
  
    set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);
    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_col.dat");
    
    // LAPACK_dgbsv(AB, &lab, &la, "AB_col.dat"); 

    //info is an informative output value of the general band solve of double precision
    info = LAPACKE_dgbsv(LAPACK_COL_MAJOR,la, kl, ku, NRHS, AB, lab, ipiv, RHS, la);
    
    
    // Fonction DGBMV de BLAS ==> MAT-VEC for COL_Major
   
   kv = 0;
   lab1 = lab -1; 
   DB = (double *) malloc(sizeof(double)*lab1*la); //for dgbmv col_major   
   set_GB_operator_colMajor_poisson1D(DB, &lab1, &la, &kv);  
   write_GB_operator_colMajor_poisson1D(DB, &lab1, &la, "DB_col.dat");
     
   cblas_dgbmv(CblasColMajor, CblasNoTrans, la, la, kl, ku, alpha, DB, lab1, EX_SOL, INCX, beta, Y, INCY);
    
  write_vec(Y, &la, "Y.dat"); //remplissage du fichier "Y.dat"    
  }    
  
  printf("\n INFO DGBSV = %d\n",info);

  write_xy(RHS, X, &la, "SOL.dat");
  

  /* Relative residual */
  //erreur = norm(EX_SOL-RHS)/norm(RHS)
  temp = cblas_ddot(la, RHS, 1, RHS,1); //RHS*RHS
  temp = sqrt(temp); //norm(RHS)
  cblas_daxpy(la, -1.0, RHS, 1, EX_SOL, 1); //EX_SOL = EX_SOL - RHS
  relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1); //cblas_ddot: multiply 2 vectors EX_SOL of la elements
  relres = sqrt(relres); //norm(EX_SOL)
  relres = relres / temp; //erreur relative residuelle: norm(EX_SOL-RHS)/norm(RHS)
  
  printf("\nThe relative residual error is relres = %e\n",relres);
  
  printf("\n\n--------- DGBMV -----------\n");  
  //Validation de DGBMV via le calcul de l erreur residuelle
  //norm(B - Y) / norm(Y)
  temp = cblas_ddot(la, Y, 1, Y,1); //Y * Y
  temp = sqrt(temp); //norm(Y)
  cblas_daxpy(la, -1.0, Y, 1, B, 1); //B - Y
  relres = cblas_ddot(la, B, 1, B,1); //B * B
  relres = sqrt(relres); //norm(B)
  relres = relres / temp;
 
  printf("\nThe relative residual error is relres = %e\n",relres);    


  //unallocate memory: free for pointers
  free(RHS);
  free(EX_SOL);
  free(X);
  free (Y);
  free (B);
  free(AB);
  free(CB);
  free(DB);
  free(ipiv);

  printf("\n\n--------- End -----------\n");
}
