function [T,spacing] = SofiasCooling(Initial_state,timestep,n_timestep,C,dike_legth)
n=length(Initial_state);
T=Initial_state;
T_new=zeros(1,n);
spacing=dike_legth/n;
for k=1:n_timestep
    for m=1:n
        if m==1
        T_new(m)=timestep/(spacing)^2*C*[-2*T(m)+T(m+1)]+T(m);        
        elseif m>1 && m<n 
        T_new(m)=timestep/(spacing)^2*C*[T(m-1)-2*T(m)+T(m+1)]+T(m);
        elseif m==n
        T_new(m)=timestep/(spacing)^2*C*[-2*T(m)+T(m-1)]+T(m);  
        end
    end
    T=T_new;
end
