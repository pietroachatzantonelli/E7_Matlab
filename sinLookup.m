function [sinTable]=sinLookup(X,table)
sinTable=zeros(size(X))

for i=1:(size(X,1))
    for j=1:(size(X,2))
       while X(i,j)>(pi)
    X(i,j)=X(i,j)-2*pi;
      end
       while X(i,j)<(-1*pi)
    X(i,j)=X(i,j)+2*pi;
       end    
      
       Xdeg=X/pi*180;
       
    dx=Xdeg(i,j)-floor(Xdeg(i,j));
    floorx=find(table(:,1)==(floor(Xdeg(i,j))));
    ceilingx=find(table(:,1)==(floor(Xdeg(i,j)+1)));
    y1=table(floorx,2);
    y2=table(ceilingx,2);
    sinTable(i,j)=(y2-y1)*dx+y1;
    end
end
end