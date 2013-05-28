% reglafalsa() Recibe los siguientes parametros
% f = funcion de la cual se quiere hallar la raiz 
% [a b] = intervalo en el que se observa la presencia de una raiz
% tol = error
% maxiter = maximo numero de iteraciones
% Ejemplo de uso : [sol,x,incr,iter]=reglafalsa('f',1,2.5,0.00001,100)
function[sol,x,incr,iter]=reglafalsa(f,a,b,tol,maxiter)
A=fopen('reglafalsa.xls','w');
fprintf(A,'\tit\ta\tf(a)\tb\tf(b)\tc\tf(c)\tincr\n');
fa=feval(f,a);
fb=feval(f,b);
if fa*fb>0
    disp('la funcion debe tener signo distinto en los extremos del intervalo')
    return
end
iter=0;
x=a;
incr = b-a;
while(incr>tol && iter<maxiter)
    c=(a*fb-b*fa)/(fb-fa);
    x=[x,c];
    fc=feval(f,c);
    if fc==0
        a=c;b=c;
    elseif fa*fc <0
        b=c;fb=fc;
    else
        a=c;fa=fc;
    end
    incr=abs(x(end)-x(end-1));
    iter=iter+1;
    y=[iter a fa b fb c fc/2 incr];
    fprintf(A,'\t%d\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\t%6.7f\n',y);
end
sol=(a*fb-b*fa)/(fb-fa);
if incr>tol
    disp('insuficientes iteracions')
end
fclose(A);