function[app, est, nf] = as ( sab, f, a, b, TOL )
h2 = ( b - a ) / 4;
fml = feval ( f, a + h2 - sqrt(1/3)*h2 );
fpl = feval ( f, a + h2 + sqrt(1/3)*h2 );
fmr = feval ( f, b - h2 - sqrt(1/3)*h2 );
fpr = feval ( f, b - h2 + sqrt(1/3)*h2 );
sac = h2 * ( fml + fpl );
scb = h2 * ( fmr + fpr );
errest = abs ( sab - sac - scb );
if ( errest < (10.0*TOL) )
    app = sac+scb;
    est = errest / 10.0;
    nf = 4; 
    return;
else
    [a1 e1 n1] = as ( sac, f, a, a+2*h2, TOL/2.0 );
    [a2 e2 n2] = as ( scb, f, a+2*h2, b, TOL/2.0 );
    app = a1 + a2;est = e1 + e2;nf = n1 + n2 + 4; 
    return;
end;