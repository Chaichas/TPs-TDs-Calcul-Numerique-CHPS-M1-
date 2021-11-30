//Temps de Calcul

clf;
//subplot(1,2,1)

x=[3,5,7,10,15,20,50,100]; 
y=[0.0002065,0.0002738,0.0003798,0.0005263,0.0013905,0.0029381,0.0397174,0.7440034];  

plot("nl",x,y); //Echelle logarithmique en y

title ( "Temps de calcul en fonction de n" );
xlabel("Taille de matrice (n)")
ylabel("Temps de Calcul (s)")

//Erreur Avant et Arriere

subplot(1,2,1)

x=[3,5,7,10,15,20,50,100]; 
y1=[1.060506D-15,3.008471D-14,1.83807D-14,1.30081D-14,8.99728D-14,4.93003D-13,8.72489D-12,2.95123D-11];

plot("nl",x,y1); 

title ( "Erreur Avant en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Erreur Avant")

subplot(1,2,2)

x=[3,5,7,10,15,20,50,100]; 
y2=[1.41104D-16,1.51621D-16,3.9467D-16,5.0508D-16,1.37593D-15,1.309092D-14,5.4439D-15,3.67006D-14];

plot("nl",x,y2); 

title ( "Erreur Arriere en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Erreur Arriere")
