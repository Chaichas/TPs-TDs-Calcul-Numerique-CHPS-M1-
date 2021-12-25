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
  int ku, kl, kv, lab;
  int *ipiv;
  int info;
  int NRHS;
  double T0, T1; //Dirichlet Boundary Conditions
  double *RHS, *EX_SOL, *X; //pointeurs
  double *AB;

  double temp, relres;

  NRHS=1; //Nombre de colonnes de B
  nbpoints=102; // points de discretisation: de x(0) a x(n+1), donc n=100
  la=nbpoints-2; // =n, without boundary conditions T0 et T1
  T0=-5.0; //Dirichlet boundary condition T0
  T1=5.0; //Dirichlet boundary condition T1

  printf("--------- Poisson 1D ---------\n\n");
  
  //Memory allocation with malloc
  RHS=(double *) malloc(sizeof(double)*la);
  EX_SOL=(double *) malloc(sizeof(double)*la);
  X=(double *) malloc(sizeof(double)*la);

  set_grid_points_1D(X, &la); //valeurs du grid de x(1) a x(n)
  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1); //source g =0
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);
  
  write_vec(RHS, &la, "RHS.dat"); //remplissage du fichier "RHS.dat"
  write_vec(EX_SOL, &la, "EX_SOL.dat"); //remplissage du fichier "EX_SOL.dat"
  write_vec(X, &la, "X_grid.dat"); //remplissage du fichier "X_grid.dat"

  kv=0; //Kv= 1: indice dans la bibliotheque Laplaack lie a dgbtrs dgbt
  ku=1;
  kl=1;
  lab=kv+kl+ku+1; 

  //AB is a 2D array of doubles, having a dim of lab * la
  AB = (double *) malloc(sizeof(double)*lab*la); //stockage de la matrice tidiagonale bande A dans le tableau AB de double de taille lab*la

 
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
  
  }
  
  else { // LAPACK_COL_MAJOR
  
    set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);
    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_col.dat");
    
    // LAPACK_dgbsv(AB, &lab, &la, "AB_col.dat"); 

    //info is an informative output value of the general band solve of double precision
    info = LAPACKE_dgbsv(LAPACK_COL_MAJOR,la, kl, ku, NRHS, AB, lab, ipiv, RHS, la);
  }    

  
  printf("\n INFO DGBSV = %d\n",info);

  write_xy(RHS, X, &la, "SOL.dat");

  /* Relative residual */
  temp = cblas_ddot(la, RHS, 1, RHS,1);
  temp = sqrt(temp); //norme de f
  cblas_daxpy(la, -1.0, RHS, 1, EX_SOL, 1); //EX_SOL = EX_SOL - RHS
  relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1); //cblas_ddot: multiply 2 vectors EX_SOL of la elements
  relres = sqrt(relres);
  relres = relres / temp; //erreur relative residuelle
  
  printf("\nThe relative residual error is relres = %e\n",relres);

  //unallocate memory: free for pointers
  free(RHS);
  free(EX_SOL);
  free(X);
  free(AB);
  free(ipiv);

  printf("\n\n--------- End -----------\n");
}
