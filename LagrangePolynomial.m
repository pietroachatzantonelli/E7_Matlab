function [P] = LagrangePolynomial(x,y)
n=length(x);
X=zeros(n,n);
for k=1:(n)
 for m=0:(n-1)
    X(k,m+1)=x(k)^(m);
 end
end
Y=[];
for d=1:n
    Y=[Y;y(d)];
end
P=X\Y;
end


    