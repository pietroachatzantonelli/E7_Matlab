function [R, E] = myNewton(f, df, x0, tol)
R=[x0];
E=[abs(feval(f,x0))];
for i=1:100
R=[R (R(end)-(feval(f,R(end))/feval(df,R(end))))];
E=[E (abs(feval(f,R(end))))];
if E(end)<tol
    break
end 
end
end

    
