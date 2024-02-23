function [I] = GaussIntegral(A,n)
spacing=2*A/n;
x=[];
I=0;
for m=0:(n-1)
x=[x,-A+spacing*m];
end
for k=1:n
I=I+spacing*(1/sqrt(2*pi)*exp(-1*(x(k))^2/2));
end
end
