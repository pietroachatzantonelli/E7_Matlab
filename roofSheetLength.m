function [L_Trap, L_Simp, L_Riem] = roofSheetLength(L_C, H, P,N)
f=@(x) 2*pi*H/P*cos(2*pi/P*x);
g=@(x) sqrt(1+(x)^2);
spacing=L_C/N;
%Trapezoidal
T=(g(f(0))+g(f(L_C)))*spacing;
for n=spacing:spacing:((N-1)*spacing)
    T=T+2*spacing*g(f(n));
end
L_Trap=T/2;
%Simpson
S=(g(f(0))+4*g(f(spacing))+g(f(L_C)))*spacing;
for m=(2*spacing):(2*spacing):((N-2)*spacing)
    S=S+spacing*(2*g(f(m))+4*g(f(m+spacing)));
end
L_Simp=S/3;
%Reimann Integral
R=0;
for k=0:spacing:(spacing*(N-1))
    R=R+spacing*g(f(k));
end
L_Riem=R;
end

