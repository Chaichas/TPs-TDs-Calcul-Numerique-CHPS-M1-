//Comparison entre l algorithme de Pivot Partiel et la fonction lu() de Scilab

subplot(1,2,1)

x=[3,5,10,15,20,50]; 
err1=[2.0398D-16,2.54678D-16,1.10898D-15,1.46674D-15,1.9102D-15,1.0471D-14];
err2=[6.585D-17,1.020255D-16,8.2172D-16,1.5306D-15,1.9868D-15,2.2024D-14];
err3=[0,0,0,0,0,0];

plot("nlnlnl",x,err1,'m*-.',x,err2,'rx:',x,err3); 
legend(["Err1","Err2","Err3"],"in_upper_left")

title ( "Comparison entre les sorties de l algorithme de Pivot Partiel et la fonction lu() de Scilab" );
xlabel("Taille de matrice (n)")
ylabel("Erreurs")

subplot(1,2,2)

x=[3,5,10,15,20,50];
Temps_alg=[0.0001774,0.0003156,0.0007488,0.0014262,0.0022444,0.009152];
Temps_Sc=[3.12D-05,3.5D-05,2.96D-05,3.3D-05,3.88D-05,9.6D-05];

plot("nlnl",x,Temps_alg,x,Temps_Sc); 
legend(["Temps_algorithme","Temps_Scilab"],"in_upper_left")

title ( "Comparison entre les Temps de Calcul de l algorithme de Pivot Partiel et la fonction lu() de Scilab" );
xlabel("Taille de matrice (n)")
ylabel("Temps de calcul")

