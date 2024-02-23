function [I]= TrinomialIntegral(a,b,P)
I=P(1)*(b-a)+P(2)*(b^2-a^2)/2+P(3)/3*(b^3-a^3);
