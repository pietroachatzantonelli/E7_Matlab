function [speed, acceleration] = speedFD(x, t, output_units)
n=length(x)
speed=zeros(1,n)
acceleration=zeros(1,n)
%FIRST THE SPEED
%for initial value
speed(1)=(x(2)-x(1))/(t(2)-t(1));
%central values
for m=2:(n-1)
speed(m)=(x(m+1)-x(m-1))/(t(m+1)-t(m-1));
end
%final values
speed(n)=(x(n)-x(n-1))/(t(n)-t(n-1));
%unit conversion
if strcmpi(output_units,'mph');
   for d=1:n
       speed(d)=speed(d)*3600/5280;
   end
end
%SECOND THE ACCELERATION
%for initial value
acceleration(1)=(speed(2)-speed(1))/(t(2)-t(1));
%central values
for m=2:(n-1)
acceleration(m)=(speed(m+1)-speed(m-1))/(t(m+1)-t(m-1));
end
%final values
acceleration(n)=(speed(n)-speed(n-1))/(t(n)-t(n-1));
%unit conversion
if strcmpi(output_units,'mph');
   for d=1:n
       acceleration(d)=acceleration(d)*3600;
   end
end
end

       
    
