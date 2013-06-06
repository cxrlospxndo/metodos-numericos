function [xj, itj, M, c] = jacobi(A, b, xo, tol)
x1=xo;
xo=xo+10*tol;
it=0;

L = tril(A, -1);
U = triu(A, 1);
D = A - L - U;
M = -D\(L + U);
c = D\b;

while (norm(x1-xo, inf)>tol)
    xo=x1;
    x1=M*xo+c;
    it=it+1;
	gg(:, it) = xo;  	  
end
xj = x1;
itj = it;
disp('        x(1)   x(2)     x(3)      x(4)')
disp('       -------------------------------')
disp(gg(:, 1:4))
fprintf(1,'Radio Espectral : p(M) = %3.5f\n', max(abs(eig(M))))
gg = [1:1:it; gg];
xlswrite('jacobi.xls', gg);