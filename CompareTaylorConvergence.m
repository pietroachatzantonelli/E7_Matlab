function [x,err,next_term]=CompareTaylorConvergence(N)
next_term=[];
x=[];
err=[];
for i=(-pi/2*N):(pi/8):(pi/2*N)
next_term=[next_term,abs(mySin(i,N+1)-mySin(i,N))];
x=[x,i];
err=[err,(abs(sin(i)-mySin(i,N)))];
end
end
