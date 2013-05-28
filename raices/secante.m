% secante() Recibe los siguientes parametros
% f = funcion de la cual se quiere hallar la raiz 
% [x1 x2] = intervalo
% tol = error
% maxiter = numero maximo de iteraciones
% Ejemplo de uso :[sol,x,incr,k]=secante('f',0,3,0.00001,20)
function[sol,x,incr,k]=secante(f,x1,x2,tol,maxiter)
A=fopen('secante.xls','w'); %abrir excel
fprintf(A,'\tit\tx0\tf(x0)\tx1\ty(x1)\tdelta\n');
x=[x1,x2];
y1=feval(f,x1);
y2=feval(f,x2);
y=[y1 y2];
i=[1 x(1) y(1) x(2) y(2) (-y(2)*(x2-x1)/(y(2)-y(1)))];
fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\n', i);
k=2;
incr=tol+1;
delta=x2-x1;
while incr>tol && k<maxiter
    m=(y(k)-y(k-1))/delta;
    delta=-y(k)/m;
    x(k+1)=x(k)+delta;
    y(k+1)=feval(f,x(k+1));
    incr=abs(delta);
    i=[k x(k) y(k) x(k+1) y(k+1) delta];
    fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\n', i);
    k=k+1;
end
if incr>tol
    sol=[ ];
    disp('diverge o insuficientes iteraciones')
else
    k=k-1;
    sol=x(end);
end
fclose(A); % cerrar excel