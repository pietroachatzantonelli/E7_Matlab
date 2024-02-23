function [B] = matInv(A)
[a,b]=size(A);
I=eye(a);
if (a~=b)||(abs(det(A))<=(10^-10))
    B=[];
else
    B=A\I;
end
end
    