function [R, E] = myBisection(f, a, b, tol)
R=(a+b)/2;
E=abs(feval(f,R(end)));
for i=1:100
    if feval(f,R(end))*feval(f,a)<0
        b=(a+b)/2;
    else
        a=(a+b)/2;
    end
    R=[R (a+b)/2];
    E=[E abs(feval(f,R(end)))];
    if E(end)<tol
        break
    end
end
end