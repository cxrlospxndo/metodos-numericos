function [L, U] = lablu(a, b) % Algoritmo de Doolittle
n = length(a);
for k=1:n
    L(k,k)=1;
    for j=k:n
        suma=0;
        for s=1:k-1
            suma=suma+L(k,s)*U(s,j);
        end
        U(k,j)=a(k,j)-suma;
    end
    for i=k:n
        suma=0;
        for s=1:k-1
            suma=suma+L(i,s)*U(s,k);
        end
        L(i,k)=(a(i,k)-suma)/U(k,k);
    end
end
Y = L\b;
X = U\Y;
disp(' L * Y = b , resolviendo para Y :')
disp(Y)
disp(' U * X = Y , resolviendo para X :')
disp(X) 
        