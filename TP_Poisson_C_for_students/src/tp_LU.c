/**********************************************/
/* tp_LU.h                                    */
/* LU factorisation                           */ 
/**********************************************/

#include "lib_poisson1D.h"
#include "tp_LU.h"

//Descente: L * Y = B
void LU_Descente(int la, int lab, double *AB, double *X, double *B){

  X[0] = B[0];  //initialisation de X0
  for (int ii = 1; ii < la; ii++){  
  	X[ii] = B[ii] - (AB[lab * ii] * X[ii - 1]);  //Xi par la methode de descente
  }
}	
  
  
 // Remontee:  U * X = B
void LU_Remontee(int la, int lab, double *AB, double *X, double *B){ 

  X[la-1] = B[la - 1]/ AB[lab * (la - 1) + 1]; //x(la-1)  
  for (int ii = (la-2); ii > -1; ii--){  
  	X[ii] = (B[ii] - (AB[lab * ii + 2] * X[ii + 1])) / AB[lab * ii + 1]; //xi par la methode de remontee
  }
}


//LU 
void Tri_LU(int la, int lab, double *AB){

  for (int ii = 1; ii < la; ii++){    
      AB[lab * ii + 1] = AB[lab * ii + 1] - ((AB[lab * ii] * AB[lab * (ii - 1) + 2]) / AB[lab * (ii - 1) + 1]);  
    }

  for (int ii = 1; ii < la; ii++){    
      AB[lab * ii] = AB[lab * ii] / AB[lab * (ii - 1) + 1];      
    }
}

//Factorisation LU
void Factorisation_LU (int la, int lab, double *AB, double *X, double *B){
	
	Tri_LU(la, lab,  AB);
	LU_Descente(la, lab, AB, X, B);
	LU_Remontee(la, lab, AB, B, X);
}


//Main Program
int main(){

	//Initiation des variables
	int lab, nbpoints,la;
	int ku, kl, kv;
	double T0, T1; 
	double *X, *RHS, *AB, *EX_SOL;
	double temp, relres; 
	
	//Dimension du probleme
	kv=0; 
	ku=1; //Upper diagonale 
	kl=1; //Lower diagonale 
	lab=kv+kl+ku+1; //lab
	
	//Boundary conditions de Dirichlet
	T0 = -5.0;
	T1 = 5.0; 
	
	//Memory allocation with malloc
	AB = (double *) malloc(sizeof(double)*la*lab); //stockage de la matrice tidiagonale
	RHS=(double *) malloc(sizeof(double)*la);  //second membre de taille la*1
	X=(double *) malloc(sizeof(double)*la); 
	EX_SOL=(double *) malloc(sizeof(double)*la); //solution exacte analytique de taille la*1
	
	//affectation des vals pour les vecteurs
	set_grid_points_1D(X, &la); //valeurs du grid de x(1) a x(n)
	set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1); //RHS
	set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1); //solution analytique
	set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv); //priorite colonne
	write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_LU.dat"); //Tab AB danslequel on stocke la matrice bande A a factoriser en LU
	
	//Factorisation LU
	
	printf("Resultat de la factorisation LU: ");
	//Tri_LU(la, lab, AB, X, RHS); 
	Factorisation_LU (la, lab, AB, X, RHS);
	
	write_vec(RHS, &la, "LU.dat"); //ecriture du vecteur RHS dans "LU.dat" solution obtenue apres factorisation de la matrice A
	
	
	//* Relative residual */
 	temp = cblas_ddot(la, RHS, 1, RHS,1); //RHS*RHS
	temp = sqrt(temp); //norm(RHS)
	cblas_daxpy(la, -1.0, RHS, 1, EX_SOL, 1); //EX_SOL = EX_SOL - RHS
	relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1); //cblas_ddot: multiply 2 vectors EX_SOL of la elements
	relres = sqrt(relres); //norm(EX_SOL)
	relres = relres / temp; //erreur relative residuelle: norm(EX_SOL-RHS)/norm(RHS)
  
	printf("\nThe relative residual error is relres = %e\n",relres);
	
	//unallocate memory: free for pointers
	free(RHS);
	free(EX_SOL);
	free(X);
	free(AB);

	printf("\n\n--------- End -----------\n"); 
  
  return 0; 
	
	}
