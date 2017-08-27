function [ ik_sol ] = RPR_ik( x, y, z, R )
%RPR_IK Write your code here. The input to the function will be the position of
%    the end effector (in inches) in the world frame, and the 
%    Rotation matrix R_30 as described in the question.
%    The output must be the joint angles and extensions of the robot to achieve 
%    the end effector position and orientation.

    %% YOUR CODE GOES HERE
    
    
    ik_sol = ones(1, 3);

end


% Test case
%[pos, R] = RPR_fk(pi,-10,pi/2)
%ik_sol = RPR_ik( pos(1), pos(2), pos(3), R );
%[pos_ik, R_ik] = RPR_fk(ik_sol(1),ik_sol(2),ik_sol(3))