function [sinPeriodic]=mySinPeriodic(X,N)
for i=1:(size(X,1))
    
while X(i)>(pi)
    X(i)=X(i)-2*pi;
end
while X(i)<(-1*pi)
    X(i)=X(i)+2*pi;
end
end
sinPeriodic=mySin(X,N);
end