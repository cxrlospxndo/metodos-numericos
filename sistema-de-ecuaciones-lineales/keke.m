% A * X = b 
% xo : solucion inicial
% tol : tolerancia 
function keke(A, b, xo, tol)

disp('Metodos Directos')
disp('################')

disp('a)Metodo de Doolittle')
disp('===================')
[Ld, Ud] = lablu(A, b);
disp('Matriz L : '); disp(Ld); 
disp('Matriz U : '); disp(Ud);

disp('b)Metodo de Crout')
disp('===============')
[Lc, Uc] = crout(A, b);
disp('Matriz L : '); disp(Lc); 
disp('Matriz U : '); disp(Uc);

disp('c)Metodo de Cholesky')
disp('==================')
[R] = cholesky(A, b);
disp('Matriz R : '); disp(R); 
disp('Matriz R'' : '); disp(R');

disp('Metodos Iterativos')
disp('##################')

disp('a)Metodo de Jacoby')
disp('================')
[xj, itj, Mj, cj] = jacobilab(A, b, xo, tol);
fprintf('Nro de iteraciones %d\nSolucion X(%d) =\n', itj, itj); disp(xj)
disp('X(k) = M * X(k-1) + c')
disp('M = '); disp(Mj)
disp('c = '); disp(cj)

disp('b)Metodo de Gauss-Seidel')
disp('=======================')
[xgs,itgs, Mgs, cgs] = gauss_seidel(A, b, xo, tol);
fprintf('Nro de iteraciones %d\nSolucion X(%d) =\n', itgs, itgs); disp(xgs)
disp('X(k) = M * X(k-1) + c')
disp('M = '); disp(Mgs)
disp('c = '); disp(cgs)
