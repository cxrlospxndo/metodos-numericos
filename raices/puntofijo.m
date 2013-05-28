% puntofijo() Recibe los siguientes parametros
% g = funcion de la cual se quiere hallar la raiz 
% p0 = valor inicial
% tolerancia = error
% iteracionesmaximas = numero maximo de iteraciones
% Ejemplo de uso : [k,p,errorabsoluto,P] = puntofijo('g',2,0.00001,10)
function [k,p,errorabsoluto,P] = puntofijo(g,p0,tolerancia,iteracionesmaximas)

P(1)= p0;
A = fopen('puntofijo.xls', 'w');
y = [1 p0 100];
fprintf(A, '\tit \tx \tincr\n');
fprintf(A, '\t%d \t%6.7f \t%6.7f\n', y);

for k=2:iteracionesmaximas
    P(k)=feval(g,P(k-1));
    errorabsoluto=abs(P(k)-P(k-1));
    errorrelativo=errorabsoluto/(abs(P(k))+eps);
    p=P(k);
    y = [k P(k) errorabsoluto];
    fprintf(A, '\t%d \t%6.7f \t%6.7f\n', y);
    if(errorabsoluto<tolerancia)|| (errorrelativo<tolerancia),break;end
end

if k==iteracionesmaximas
    disp('superado el numero maximo de iteraciones')
end

P=P';
fclose(A);