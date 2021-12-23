w=rand(1000,1000);
A=w*w';
tic();
[L,d]=LDLFactorisation_Compacte(A);
disp(toc());
