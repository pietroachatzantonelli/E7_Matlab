function [ConvergeOrNot, ConvergeToRoot] = NewtonConv(d, z, n, tol)
%I have t write my function to take in account that there are only n
%iterations
%this function hopes and assumes that everything will fall into place.
 f = @(x) x^d-1;
 df = @(x) d*x^(d-1); 
 R=z;
 for m=1:n
R=(R(end)-(feval(f,R(end))/feval(df,R(end))))
end
[solutions] = PolynomialExactSolutions(d)
for h=1:d
    if abs(solutions(h)-R)<tol
        ConvergeOrNot=1;
        ConvergeToRoot=solutions(h);
        
        return
    end
end
    ConvergeOrNot=0;
    ConvergeToRoot=NaN;
end




