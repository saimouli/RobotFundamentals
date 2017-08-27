function [ pos, R ] = RPR_fk( theta1, d2, theta3 )
%RPR_FK Write your code here. The input to the function will be the joint
%    angles of the robot in radians, and the extension of the prismatic joint in inches.
%    The output includes: 
%    1) The position of the end effector and the position of 
%    each of the joints of the robot, as explained in the question.
%    2) The rotation matrix R_03, as explained in the question.

    %% YOUR CODE GOES HERE
    pos = zeros(4, 3);
    R = eye(3);
    
     world_frame= eye(4);
    % x,y,z of every homogenous matrix with respect to world frame 
  
    pos = [world_frame(1:3,4)';[0 0 10];[-d2*cos(pi/4)*sin(theta1) d2*sin(pi/4)*cos(theta1) 10-d2*cos(pi/4)];...
        [-d2*cos(pi/4)*sin(theta1)-5*cos(theta3)*sin(theta1)  d2*sin(pi/4)*cos(theta1)+5*cos(theta3)*cos(theta1) ...
        10-d2*cos(pi/4)+5*sin(theta3)]];

    R00 =  [cos(theta1) -sin(theta1) 0;
        sin(theta1) cos(theta1) 0;
        0             0         1];
    
    R01= R00*[1 0 0;
        0 cos(-3*pi/4) -sin(-3*pi/4);
        0 sin(-3*pi/4) cos(-3*pi/4)];
    
    % R02
    R12_inter1=[1 0 0;
        0 cos(-pi/2) -sin(-pi/2);
        0 sin(-pi/2) cos(-pi/2)];
    
    R12_inter2=[cos(pi/2) 0 sin(pi/2);
        0 1 0;
        -sin(pi/2) 0 cos(pi/2)];
              
    R02= R01*R12_inter1*R12_inter2;
    
    % R03
    R23_inter0= [cos(pi/4) -sin(pi/4) 0;
               sin(pi/4)  cos(pi/4) 0;
                    0      0    1];
              
    R23_inter1= [cos(theta3) -sin(theta3) 0;
                 sin(theta3)  cos(theta3) 0;
                    0            0        1];
  
    R23_inter2= [1 0 0;
                 0 cos(pi/2) -sin(pi/2); %around x
                 0 sin(pi/2) cos(pi/2)];
  
    R23_inter3= [cos(pi/2) -sin(pi/2) 0; %around z
                 sin(pi/2) cos(pi/2)  0;
                  0 0 1];
           
    R03= R02 *R23_inter0*R23_inter1 * R23_inter2 * R23_inter3;
  
  
    R= R03;
    
end
