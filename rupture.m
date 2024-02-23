function Pe = rupture(a,coor,lengmag,attenu,magstat)

%RUPTURE  Compute Exceeding Probability of Seismic Intensity given a Fault Rupture
%   Pe = RUPTURE(a,coor,lengmag,attenu,magstat) computes the probability 
%   that the seismic intensity (in Peak Ground Acceleration, PGA) at the point
%   of interest is greater than the given level, a (scalar).
%
%   The other four input arguments are
%
%   coor = [x1 x2 y1] : defines the geometry of the fault
%       ~ The endpoints of the fault are (x1,y1) and (x2,y1) while
%         the point of interest is located at the coordinate (0,0).
%
%   lengmag = [a1 a2] : relationship between rupture length, s and 
%                       earthquake magnitude, m.
%       ~  s  =  exp( a1*m + a2 )
%   
%   attenu = [b1 b2 b3 b4]: attenuation law
%       ~  A = b1 * exp(b2*m) * (b3+r)^(-b4)
%            where
%              A is the seismic intensity (PGA)
%              r is nearest distance to rupture
%
%   magstat = [m0 mu lamb] : parameters for magnitude's probability
%                            density function (PDF)
%       ~ f_M(m), PDF of the magnitude M is
%            lamb*exp[-lamb*(m-m0)]/{1-exp[-lamb*(mu-m0)]} if m0<=m<=mu
%            0                                            elsewhere

%   J. Song 09-11-03
%   Dept. of Civil and Environmental Engineering
%   University of California at Berkeley

if nargin ~= 5,
    error('Requires five input arguments.')
end

Err_ind = all(size(a)==[1 1])& ...
          (all(size(coor) == [3 1])| all(size(coor) == [1 3]))& ...
          (all(size(lengmag) == [2 1])| all(size(lengmag) == [1 2]))& ...
          (all(size(attenu) == [4 1])|all(size(attenu) == [1 4]))& ...
	  (all(size(magstat) == [3 1])|all(size(magstat) == [1 3]));

if Err_ind == 0,
   error('Incorrect dimensions for input arguments.')
end

% Geometry of the fault

x1 = coor(1);
x2 = coor(2);
y1 = coor(3);

% Relationship b/w rupture length and earthquake magnitude

a1 = lengmag(1);
a2 = lengmag(2);

% Attenuation law

b1 = attenu(1);
b2 = attenu(2);
b3 = attenu(3);
b4 = attenu(4);

% Magnitude's PDF

m0 = magstat(1);
mu = magstat(2);
lamb = magstat(3);

% PDF of M

Nm = 1000; % No. of discretized points between m0 and mu for numerical integration
dm = linspace(m0,mu,Nm);
fM = lamb*exp(-lamb*(dm-m0))/(1-exp(-lamb*(mu-m0)));

% Ruptre length

s = exp(a1*dm+a2);

% Critical nearest distance to rupture causing the exceedance

rcr = (b1*exp(b2*dm)/a).^(1/b4)-b3;

% Compute the conditional exceedance probability given magnitude M=m

switch sign(x1*x2),

case {1,0}, % When the two endpoints are on the same side w.r.t the point of interest

   min_x = min([abs(x1) abs(x2)]);
   max_x = max([abs(x1) abs(x2)]);
   x1 = min_x;
   x2 = max_x;
    
   for i = 1:Nm,
     if rcr(i)<=sqrt(x1^2+y1^2),
         PeM(i) = 0;
     elseif sqrt(rcr(i)^2-y1^2) < abs(x2)-s(i),
         PeM(i) = (sqrt(rcr(i)^2-y1^2)-abs(x1))/(abs(x2-x1)-s(i));
     else 
         PeM(i) = 1;
     end
   end

case -1, % When the two endpoints are on the different sides w.r.t. the point of interest

   for i = 1:Nm,
     if rcr(i) < y1,
        PeM(i) = 0;
     elseif sqrt(rcr(i)^2-y1^2)<=min([abs(x1) abs(x2)])-s(i),
        PeM(i) = (2*sqrt(rcr(i)^2-y1^2)+s(i))/(abs(x2-x1)-s(i));
     elseif sqrt(rcr(i)^2-y1^2)<=max([abs(x1) abs(x2)])-s(i);
        PeM(i) = (min([abs(x1) abs(x2)])+sqrt(rcr(i)^2-y1^2))/(abs(x2-x1)-s(i));
     else
        PeM(i) = 1;
     end
   end

end

Pe = trapz(dm,fM.*PeM);

return