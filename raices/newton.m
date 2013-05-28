% newton() Recibe los siguientes parametros
% func = funcion de la cual se quiere hallar la raiz 
% dfunc = primera derivada de 'func'
% x = valor inicial
% precis = error
% Ejemplo de uso : [res, it] = newton('func', 'dfunc', 2, 0.00001)
function[res,it] = newton(func,dfunc,x,precis)
A=fopen('newton.xls','w'); %abrir excel
it=0; x0=x;
d=feval(func,x0)/feval(dfunc,x0);
y=[it x0 d (x0-d)];
fprintf(A,'\tit\txn\tf(xn)/f''(xn)\txn+1\n');
fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\n',y); %iteracion inicial
while abs(d)>precis
    x1=x0-d;
    it=it+1;
    x0=x1;
    d=feval(func,x0)/feval(dfunc,x0);
    y=[it x0 d x1];
    fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\n',y); %imprimiendo cada iteracion
end;
res=x0;
fclose(A); % cerrar excel