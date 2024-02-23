function [range]=TaylorAccRange(N,tol)
top=Inf;
bot=-Inf;
for i=0:0.0001:(pi)
    if abs(mySin(i,N)-sin(i))>tol
        top=i-0.0001;
        break
    end
end
for d=0:-0.0001:(-1*pi)
     if abs(mySin(d,N)-sin(d))>tol
        bot=d+0.0001;
        break
     end
end
    range=[bot top];
end