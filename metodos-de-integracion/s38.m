function integ = s38(f, xl, xu, n)
h=(xu-xl)/(2*n);
x=xl+h;
integ=feval(f,xl)+feval(f,xu);
i=1;
while (x<xu)
    if (i<=2)
        integ=integ+3*feval(f,x);
        i=i+1;
    else
        integ=integ+2*feval(f,x);
        i=1;
    end
    x=x+h;
end
integ=integ*3*h/8;