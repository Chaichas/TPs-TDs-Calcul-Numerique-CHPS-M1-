//Estimation du temps ecoule
//stacksize('max')
n = 10000;
A = rand(n,n);
xex=rand(n,1);

timer ();
tic ();
//b=A*xex; //Output: 0.266089   0.277177   1.0416703
A = rand(n,n); //output: 5.719562   5.961835   1.0423587
tUser = toc();
tCpu = timer ();
disp([ tUser tCpu tCpu/tUser])
funcprot(0)
