//y1: Temps Produit Matrice-Matrice "ijk" a 3 boucles
//y2: Temps Produit Matrice-Matrice "ijk" a 2 boucles
//y3: Temps Produit Matrice-Matrice "ijk" a 1 boucle

clf;
//Temps de calcul
subplot(2,2,1)  
x=[1,2,3,4,5,6,7]; 
y1=[0.00013,0.923494,23.934692,139.92913,619.32445,948.47501,1294.0011];  
y2=[0.000156,0.036103,0.44034,1.902311,7.099506,10.344888,13.98408];
y3=[0.000558,0.002565,0.047085,0.24971,1.144587,1.63069,2.360478];

plot(x,y1,'m*-.',x,y2,'rx:',x,y3);
legend(["Temps_3boucles","Temps_2boucles","Temps_1boucle"],"in_upper_left")

title ( "Temps de calcul en fonction des iterations (tailles de matrices)" );
xlabel("Iteration")
ylabel("Temps de calcul (s)")

//y1: Temps Produit Matrice-Matrice "ijk" a 3 boucles
subplot(2,2,2)
x=[1,2,3,4,5,6,7]; 
y1=[0.00013,0.923494,23.934692,139.92913,619.32445,948.47501,1294.0011];  

plot("nl",x,y1,'m*-.');

//title ("Temps de calcul du Produit Matrice-Matrice ijk a 3 boucles en fonction des iterations (tailles de matrices)" );
xlabel("Iteration")
ylabel("Temps_3 boucles(s)")

//y2: Temps Produit Matrice-Matrice "ijk" a 2 boucles
subplot(2,2,3)
x=[1,2,3,4,5,6,7]; 
y2=[0.000156,0.036103,0.44034,1.902311,7.099506,10.344888,13.98408];

plot("nl",x,y2,'rx:');

//title ("Temps de calcul du Produit Matrice-Matrice ijk a 2 boucles en fonction des iterations (tailles de matrices)" );
xlabel("Iteration")
ylabel("Temps_2 boucles(s)")

//y3: Temps Produit Matrice-Matrice "ijk" a 1 boucle
subplot(2,2,4)
x=[1,2,3,4,5,6,7]; 
y3=[0.000558,0.002565,0.047085,0.24971,1.144587,1.63069,2.360478];

plot("nl",x,y3);

//title ("Temps de calcul du Produit Matrice-Matrice ijk a 1 boucle en fonction des iterations (tailles de matrices)" );
xlabel("Iteration")
ylabel("Temps_1 boucle(s)")
