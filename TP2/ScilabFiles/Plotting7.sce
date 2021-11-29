//Erreur Avant

clf;
subplot(1,2,1)

x=[100,300,500,800,900,1000]; 
y=[4.25D-13 4.20D-12 1.08D-11 1.51D-11 5.70D-11 1.66D-10];  

plot("nl",x,y); //Echelle logarithmique en y

title ( "Erreur Avant en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Erreur avant (err)")


//Erreur Arriere

subplot(1,2,2)
x=[100,300,500,800,900,1000];  
y=[3.158D-16,6.48D-16,9.60D-16,1.20D-15,1.32D-15,1.08D-15];

plot("nl",x,y); //Echelle logarithmique en y

title ( "Erreur Arriere en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Erreur arriere (relres)")

