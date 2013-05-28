% Ejemplo, usar 'func' 
% xmin:0 xmax:5 ymin:0 ymax:5 x0:(5 -5) eps:10^-5
% function c = func(x, y) %sistema a resolver
% a = 2*x*x -x*y - 5*x +1;
% b = x + 3*log(x) - y*y;
% c =[a; b];
% end
clear all;
clc;
cla;
close all;
fprintf('\n\n\n');
fprintf('Sistema de Ecuaciones no Lineales\n');
f=input('Ingrese la funcion a resolver : ');
fprintf('\n\n');
fprintf('Para Graficar\n\n');
xmin=input('Ingrese un xmin : ');
fprintf('\n');
xmax=input('Ingrese un xmax : ');
fprintf('\n');
ymin=input('Ingrese un ymin : ');
fprintf('\n');
ymax=input('Ingrese un ymax : ');
fprintf('\n\n');

xm = xmin : 0.1 : xmax;
ym = ymin : 0.1 : ymax;

[X, Y] = meshgrid(xm, ym);
[fi, co] = size(X);
ff = feval(f, X, Y);
h = figure(1);
contour(X, Y, ff(1:fi,:), [0,0], 'b');
grid on;
hold on;
contour(X, Y, ff(fi+1:2*fi,:), [0,0],'r');
title('SISTEMA DE ECUACIONES NO LINEALES\n');
xlabel('Eje x');
ylabel('Eje y');
legend('f(x, y) = 0. g(x, y) = 0');
aa=1;
A = fopen('newton2d.xls', 'w');
fprintf(A, '\tit \tx \ty \txn \tyn \terror\n');

while(aa == 1)
   fprintf('Para comenzar a iterar : \n\n');
   x = input('\tIngrese el x0 : ');
   fprintf('\n');
   y = input('\tIngrese el y0 : ');
   fprintf('\n');
   tol = input('\tIngrese la tolerancia : ');
   error = 1000;
   h = 0.00001;
   it = 1;
   while(error > tol)
       ff_gg = feval(f, x, y);
       ff = ff_gg(1);
       gg = ff_gg(2);
       
       fxgx=(feval(f, x+h, y)-feval(f, x, y))/h;
       fygy=(feval(f, x, y+h)-feval(f, x, y))/h;
       
       fx = fxgx(1);
       gx = fxgx(2);
       fy = fygy(1);
       gy = fygy(2);      
       
       XX = -([fx fy;gx gy]\[ff;gg])+[x;y];
       xn = XX(1);
       yn = XX(2);
       error = sqrt((xn-x)^2+(yn-y)^2);
       i = [it x y  xn yn error];
       fprintf(A, '\t%d \t%6.7f \t%6.7f \t%6.7f \t%6.7f \t%6.7f\n', i);
       x = xn;
       y = yn;
       it = it +1;
   end
   fprintf('RPTA : \n\n');
   fprintf('\n\t x = %5.10f', x);
   fprintf('\n\t y = %5.10f', y);
   fprintf('\n\n');
   rpta = input('Desea calcular otra solucion [y/n] : ', 's');
   if(rpta == 'y') || (rpta == 'Y')
       %figure(gcf); %para que la grafica aparezca en el primer plano
       aa = 1;
   else
       aa = 2;
       fprintf('\n\nUd. Ha salido del programa');
   end
end
fclose(A);
