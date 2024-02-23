function [output] = NewtonFractal(d,n,tol,res,ULcorner,sqrL)
%here I define the x and y axis
spacing=sqrL/(res-1);
[X,Y]=meshgrid((ULcorner(1)):spacing:(ULcorner(1)+sqrL),(ULcorner(2)):-spacing:(ULcorner(2)-sqrL));
%Defining Z
Z=X+Y*i;
%finding exact solutions
solutions=PolynomialExactSolutions(d);
%defining output matrix and insering values
output=zeros(size(Z));
colormapred=[1,1,0,0,1,0,1,0.5,0.5,0.5];
colormapgreen=[1,0,1,0,1,1,0,0,1,0.5];
colormapblue=[1,0,0,1,0,1,1,1,0,0.5];
%performing Newton's method
 f = @(x) x^d-1;
 df = @(x) d*x^(d-1);
     for a=1:1:res
         for b=1:1:res
             for m=1:n
            Z(a,b)=(Z(a,b)-(feval(f,Z(a,b))/feval(df,Z(a,b))));
             end
         
             for h=1:1:(d)
                     if abs(solutions(h)-Z(a,b))<tol %this sneaks in the value of d
                           output(a,b)=h;
                     end
             end
             
     end        
     end
 img=cat(3,(colormapred(output+1)),(colormapgreen(output+1)),(colormapblue(output+1)));
 final=image(img)

end