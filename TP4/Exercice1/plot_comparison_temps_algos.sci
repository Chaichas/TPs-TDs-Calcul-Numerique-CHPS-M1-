clf();
n=[5,10,20,40,60,80,100,1000]; //taille n de la matrice A
LU=[0.000348, 0.001003,0.004469,0.036776,0.1153720,0.279546,0.50551,515.38789];
t_compacte=[0.000211,0.00032,0.000632,0.002045,0.003558,0.005799,0.0083650,1.194137];


plot2d(n, LU,12,logflag='nl'); 
plot2d(n, t_compacte,3,logflag='nl'); 

legend(["Temps de calcul de factorisation LU","Temps de calcul de factorisation LDLt"],"in_upper_left")

xlabel("Taille de matrice (n)")
ylabel("Temps de calcul des algorithmes (s)")
 
