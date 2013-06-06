function T4 = taylor(df, a, b, ya, M)
% ya : y(a)
% df = [y' y'' y''' y'''']

h = (b-a)/M;
T = zeros(1, M+1);
Y = zeros(1, M+1);
T = a:h:b;
Y(1) = ya;

for j=1:M
    D = feval(df, T(j), Y(j));
    Y(j+1) = Y(j) + h*(D(1) + h*(D(2)/2 + h*(D(3)/6 + h*D(4)/24)));
end

T4 = [T' Y'];