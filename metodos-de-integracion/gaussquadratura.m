function y = gaussquadratura( f, a, b, TOL )
h2 = ( b - a ) / 2;
fm = feval ( f, a + h2 - sqrt(1/3)*h2 );
fp = feval ( f, a + h2 + sqrt(1/3)*h2 );
sab = h2 * ( fm + fp );
[approx eest nfunc] = as ( sab, f, a, b, TOL );
if ( nargout == 0 )
    s = sprintf ('\t\t approximate value of integral: \t %.12f \n', approx );
    s = sprintf ('%s \t\t error estimate: \t\t\t %.4e \n', s, eest );
    s = sprintf ('%s \t\t number of function evaluations: \t %d \n', s, nfunc+2 );
    disp ( s )
else
    y = approx;
end;
return

