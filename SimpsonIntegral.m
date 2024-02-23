function [I,e]=SimpsonIntegral(f,a,b,n)
spacing=(b-a)/(2*n);
I=0;
X=a:spacing:b;
for m=0:(n-1)
    P=LagrangePolynomial([X(2*m+1),X(2*m+2),X(2*m+3)],[f(X(2*m+1)),f(X(2*m+2)),f(X(2*m+3))]);
    s=TrinomialIntegral(X(2*m+1),X(2*m+3),P);
    I=I+s;
end
e=abs(integral(f,a,b)-I);
end
