//Nombre d iterations en fonction de epsilon
//Comparison entre Gauss et Jaccobi
clf();
n=[1,2,3,4,5,6,7,8,9]; //taille n de la matrice A
jac=[0,9,17,25,33,41,49,57,65];
gauss=[0,2,6,9,12,16,19,22,26];


plot2d(n, jac,12); 
plot2d(n, gauss,3); 

legend(["Jaccobi","Gauss Seidel"],"in_upper_left")

xlabel("Epsilon = 10**( -val)")
ylabel("Nombre d iterations ")
 
 

//Nombre des iterations en fonction de n
//Comparison entre Jaccobi et Gauss Seidel
clf();
n=[10,20,30,40,50,60,70,80,90,100]; //taille n de la matrice A
jac=[403,1397,2937 ,4999,7565,10621, 14158,18166,22637,27563];
gauss=[182,600,1218,2014,2976,4091,5351,6748,8275,9926];

plot2d(n, jac,12); 
plot2d(n, gauss,3); 

legend(["Jaccobi","Gauss Seidel"],"in_upper_left")

xlabel("Taille de la matrice A (n)")
ylabel("Nombre d iterations")



//Plot relatif a Richardson
clf();
n1=[0.2,0.5,0.8,1,1.2,1.5,1.8,2,2.5,3,3.5,3.6,3.7,3.8, 3.9,3.918985939]; //taille n de la matrice A
jac1=[264, 403,938,665,544,450,396,371, 328,300, 280,277, 274,271,268,268];

plot2d(n1, jac1,3); 
xlabel("Alpha")
ylabel("Nombre d iterations")
legend(["Richardson"])
