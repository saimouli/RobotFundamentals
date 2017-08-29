function [ ik_sol ] = RPR_ik( x, y, z, R )
%RPR_IK Write your code here. The input to the function will be the position of
%    the end effector (in inches) in the world frame, and the 
%    Rotation matrix R_30 as described in the question.
%    The output must be the joint angles and extensions of the robot to achieve 
%    the end effector position and orientation.

    %% YOUR CODE GOES HERE
    %ik_sol = ones(1, 3);
    
    %sin(theta1)/cos(theta1) = tan(theta1) (R21,R11)
    theta1= atan2(R(2,1),R(1,1));
    
    theta3= atan2(R(3,3),-R(3,2)); %=+/-
    
    d2 = -(z-5*sin(theta3)-10)/cos(pi/4); %z of P03
    %d2=(y-5*cos(theta3)*cos(theta1))/(sin(pi/4)*cos(theta1));
    ik_sol = [theta1 d2 theta3];
    
        
end


% Test case
% [pos, R] = RPR_fk(0,5,0)
% ik_sol = RPR_ik( pos(4,1), pos(4,2), pos(4,3), R );
% [pos_ik, R_ik] = RPR_fk(ik_sol(1),ik_sol(2),ik_sol(3))