A= rand(10, 10);
B= rand(10, 5);

function[C]=matmat3b(A, B)
[m p] = size(A) 
[p n] = size(B) 

tic();
for i = 1:m
    for j = 1:n
        for k = 1:p
            C(i,j)=A(i,k)*B(k,j)+C(i,j);
        end
    end
end
toc();
endfunction

c= exec ("matmat3b(A, B)");
