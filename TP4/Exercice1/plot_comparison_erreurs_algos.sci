clf();

n=[5,10,20,40,60,80,100]; //taille n de la matrice A
condA=[693.28446,1790.7644,67704.804,218188.22,186190.89,18920139,6.194D+10];
LU=[2.220D-16,1.386D-15, 6.647D-15,2.383D-14,3.261D-14,8.602D-14,1.253D-13];
t_compacte=[1.110D-16,1.047D-15,4.119D-15,1.185D-14,1.733D-14,7.544D-14, 8.147D-14];

subplot(121)
plot2d(n, LU,12,logflag='nl'); 
plot2d(n, t_compacte,3,logflag='nl'); 

legend(["Factorisation LU","Factorisation LDLt"],"in_upper_left")

xlabel("Taille de matrice (n)")
ylabel("Erreurs de Factorisation)")

subplot(122)
plot2d(n, condA,7,logflag='nl'); 
xlabel("Taille de matrice (n)")
ylabel("Conditionnement de la matrice A")
