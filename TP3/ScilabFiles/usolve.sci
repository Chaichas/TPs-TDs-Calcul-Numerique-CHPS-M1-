function[x]=usolve(U,b)
//[n n] = size(L) 
n = size(b)(1) //afficher le size du 1er element
x=zeros(n, 1);

x(n)=b(n)/U(n, n);

for i = n-1:-1 : 1
    x(i)=(b(i)-U(i,(i+1):n)*x((i+1):n))/U(i,i);
end

endfunction


//A=rand(10, 10)
//L=tril(A)
//U= triu(A)
