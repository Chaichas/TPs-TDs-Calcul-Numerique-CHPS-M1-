subplot(1,2,1)

x=[3,5,7,10,15,20,50,100]; 
y1=[9.14E-05,0.0001877,0.0003686,0.0008811,0.0021304,0.0044774,0.0570981,0.4545931];

plot("nl",x,y1); 

title ( "Temps de calcul en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Temps de calcul (s)")

subplot(1,2,2)

x=[3,5,7,10,15,20,50,100]; 
y2=[1.04412E-16,2.9044E-16,3.8499E-16,1.1106E-15,2.60088E-15,1.43627E-14,1.8172E-14,1.16529E-13];

plot("nl",x,y2); 

title ( "Erreur de factorisation en fonction de la taille de matrice n" );
xlabel("Taille de matrice (n)")
ylabel("Erreur de factorisation")
