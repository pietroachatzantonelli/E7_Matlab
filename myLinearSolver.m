function [x1, x2, x3] = myLinearSolver(A1, b1, A2, b2, A3, b3)
A=[A1;A2;A3];
b=[b1;b2;b3];
X=A\b;
x1=X(1);
x2=X(2);
x3=X(3);
end
