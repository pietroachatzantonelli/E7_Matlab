function [sinSeries]=mySin(X,N)
sinSeries=zeros(size(X));
for d=1:N
    termC=((-1)^(d-1))/(prod(1:(2*d-1)));
    term=termC*X.^(2*d-1);
    sinSeries=sinSeries+term;
end
end

    