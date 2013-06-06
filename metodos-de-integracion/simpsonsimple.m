function Z = simpsonsimple(f, a, b)

h = (b - a)/2;
C = zeros(1, 3);
%C = feval(f, [a (a+b)/2 b]);
C(1) = feval(f, a);
C(2) = feval(f, (a+b)/2);
C(3) = feval(f, b);
S = h*(C(1) + 4*C(2) + C(3))/3;
%S2 = S;
%tolerancia1 = tolerancia;
%errorabsoluto = tolerancia;

%Z = [a b S S2 errorabsoluto tolerancia];
Z = S;