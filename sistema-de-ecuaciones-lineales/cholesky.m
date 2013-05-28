function [L, LT]=cholesky(A,b)
n=length(A);
for i=1:n-1
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
    A(i,i:n)=A(i,i:n)/A(i,i)^0.5;
end
A(n,n)=A(n,n)^0.5;
LT=triu(A);
L=LT';

Y = L\b;
X = LT\Y;
disp(' L * Y = b , resolviendo para Y :')
disp(Y)
disp(' LT * X = Y , resolviendo para X :')
disp(X)