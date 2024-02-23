function [solutions] = PolynomialExactSolutions(d)
% phi=2*pi*n/d for z^d=1 thanks to Euler's rule
phis=[];
for n=0:(d-1)
    phi=2*pi*n/d;
    phis=[phis phi];
end
solutions=exp(i*phis);
end