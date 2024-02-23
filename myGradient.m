function [grad]=myGradient(f,bbox,N)
grad=zeros((N-2),(N-2),2);
x=[bbox(1)];
y=[bbox(4)];
while x(end)<bbox(2)
    x=[x,(x(end)+(bbox(2)-bbox(1))/(N-1))];
end
while  y(end)>bbox(3)
    y=[y,(y(end)+(bbox(3)-bbox(4))/(N-1))];
end
for row=2:(N-1)
    for col=2:(N-1)
        grad(row-1,col-1,1)=(((f(x(col+1),y(row))-f(x(col-1),y(row)))/(x(col+1)-x(col-1))));
        grad(row-1,col-1,2)=(((f(x(col),y(row+1))-f(x(col),y(row-1)))/(y(row+1)-y(row-1))));
    end
end
end

