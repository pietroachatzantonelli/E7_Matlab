function [site_data]=mySoilSpline(borehole_data,site_locations)

%i dont know what to do with the NaNs

site_data2=interp1(borehole_data(1,:),borehole_data(2,:),site_locations,'spline');
site_data3=interp1(borehole_data(1,:),borehole_data(3,:),site_locations,'spline');
site_data4=interp1(borehole_data(1,:),borehole_data(4,:),site_locations,'spline');
site_data5=interp1(borehole_data(1,:),borehole_data(5,:),site_locations,'spline');
site_data6=interp1(borehole_data(1,:),borehole_data(6,:),site_locations,'spline');
site_data7=interp1(borehole_data(1,:),borehole_data(7,:),site_locations,'spline');
site_data=[site_locations;site_data2;site_data3;site_data4;site_data5;site_data6;site_data7];
end