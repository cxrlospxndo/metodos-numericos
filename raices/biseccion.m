% biseccion() Recibe los siguientes parametros
% func = funcion de la cual se quiere hallar la raiz 
% [a b] = intervalo en el que se observa la presencia de una raiz
% tol = error
% Ejemplo de uso : [res, i] = biseccion('func', -2, -1, 0.00001)
function[res,i] = biseccion(func, a, b,tol)
i=0;
A=fopen('biseccion.xls','w');
fprintf(A,'\ti\ta\tb\td1\td2\tx\t(b-a)/2\n');
while(b-a)/2>=tol
    x=(a+b)/2;
    d1=feval(func,a);
    d2=feval(func,x);
    i=i+1;
    y=[i a b d1 d2 x (b-a)/2];
    if d1*d2<0
        b=x;
    else
        a=x;
    end
    fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\n',y);
end
res=(a+b)/2;
fclose(A);% cerrar excel