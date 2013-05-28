function [L,U]=crout(A,b)
n=size(A,1);
for k=1:n
    for i=k:n;
        if k==1 
            suma=0; 
        else
            suma=dot(A(i,1:k-1),A(1:k-1,k));
        end
        A(i,k)=A(i,k)-suma;
    end
    for i=k+1:n;
        if k==1 
            suma=0;
        else
            suma=dot(A(k,1:k-1),A(1:k-1,i));
        end
        A(k,i)=(A(k,i)-suma)/A(k,k);
    end
end
L=tril(A,0); U=triu(A,1)+eye(n,n);
Y = L\b;
X = U\Y;
disp(' L * Y = b , resolviendo para Y :')
disp(Y)
disp(' U * X = Y , resolviendo para X :')
disp(X)