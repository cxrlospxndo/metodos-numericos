function s = simpson3_8(f, a, b, M)
% Simpson 3 / 8
h = (b-a)/(2*M);
s1 = 0;
s2 = 0;
s3 = 0;

for k=1:2*M
    x = a + h*k;
    resto = rem(k, 3);
    if( resto == 1)
        s1 = s1 + feval(f, x);
    end
    if( resto == 2 )
        s2 = s2 + feval(f, x);
    end
    if( resto == 0 )
        s3 = s3 + feval(f, x);
    end 
end

s = 3*h*(feval(f, a) + feval(f, b) + 3*s1 + 3*s2 + 2*s3)/8;