% In this function, you need to convert the rotation matrix R into axis-angle form

function [axang] = rotm2axang(R)
 
    % Your code starts here
    %vec = [0 0 0];
    
    theta = acos((trace(R)-1)/2);
    r= (1/(2*sin(theta)))*[R(3,2)-R(2,3) R(1,3)-R(3,1) R(2,1)-R(1,2)];
    %v_theta= 1-cos(theta);
    %rotation matrix used to find the x,y,z axis 
%      R_new = [r(1)^2*v_theta+cos(theta) r(1)*r(2)*v_theta-r(3)*sin(theta) r(1)*r(3)*v_theta+r(2)*sin(theta)
%             r(1)*r(2)*v_theta+r(3)*sin(theta) r(2)^2*v_theta+cos(theta) r(2)*r(3)*v_theta-r(1)*sin(theta)
%             r(1)*r(3)*v_theta-r(2)*sin(theta) r(2)*r(3)*v_theta+r(1)*sin(theta) r(3)^2*v_theta+cos(theta)
%             ];

     x= sqrt((R(1,1)+1)/2);
     y1= sqrt((R(2,2)+1)/2);
     
     y= R(2,1)/(2*x);
     z= R(3,1)/(2*x);
     
     if (x==0 && y1~=0)
         y= sqrt((R(2,2)+1)/2);
         x= R(2,1)/(2*y);
         z= R(2,3)/(2*y);
     else
         z= sqrt((R(3,3)+1)/2);
         x= R(3,1)/(2*z);
         y= R(3,2)/(2*z);
     end
     
    %1 if theta=0 no rotation and infinite solutions [NaN,NaN,NaN] vector
    %2 if theta=pi two solutions vec is 2x3 vector containing two solutions
    %3 else one solution and 1x3 vector contaning one solution 
    if (theta == 0)
        vec= [NaN NaN NaN];
        
    elseif (theta == pi)
       axang= [x y z theta;-x -y -z theta];
       return;
    else
       vec= r;
    end
    
    axang = [vec, theta];
%%
% To test the function 
% R = [-1 0 0;
%      0 -1 0;
%      0 0 1;];
%  
% [axang] = rotm2axang(R)
end