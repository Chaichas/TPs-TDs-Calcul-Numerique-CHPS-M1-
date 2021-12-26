/**********************************************/
/* tp_LU.c                                    */
/* Header for LU factorisation                */ 
/**********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>
#include <limits.h>
#include "blaslapack_headers.h"


void LU_Descente(int la, int lab, double *AB, double *X, double *B);
void LU_Remontee(int la, int lab, double *AB, double *X, double *B);
void Tri_LU(int la, int lab, double *AB);
void Factorisation_LU (int la, int lab, double *AB, double *X, double *B);
