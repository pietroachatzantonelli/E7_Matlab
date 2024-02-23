function [interpolated_angles]=gait_data_interp(crude_gait_cycle,crude_angles,ideal_gait_cycle,interp_method)
if strcmp(interp_method,'linear')+strcmp(interp_method,'cubic')+strcmp(interp_method,'spline')==0
    fprintf=('Please input either linear, cubic, or spline.')
    interpolated_angles=[];
    return
end
[interpolated_angles]=interp1(crude_gait_cycle,crude_angles,ideal_gait_cycle,interp_method);
end



    
