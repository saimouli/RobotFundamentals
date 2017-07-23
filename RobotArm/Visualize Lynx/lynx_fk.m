function [ pos ] = lynx_fk( theta1, theta2, theta3, theta4,theta5, g )
%LYNX_FK The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in inches.
%    The output must contain 10 positions of various points along the robot arm as specified
%    in the question.

%  pos = lynx_fk(pi,pi/2,pi/2,-pi/2,-pi/6,2)

% pos = lynx_fk(-2.09, -0.524, 1.05, 1.57, 2.62, 2.17)
%     0         0         0
%     0         0    3.0000
%     1.4275    2.4979    7.9785
%    -1.7372   -3.0397    4.2757
%    -1.7372   -3.0397    4.2757

%    -0.9908   -1.7337    1.6800
%    -1.0563   -0.7588    2.1517
%    -0.9253   -2.7087    1.2083
%    -0.7765   -0.2691    1.1783
%    -0.6455   -2.2189    0.2350

% pos = lynx_fk(0, 0, 0, 0, 0, 2)
%     0         0         0
%     0         0         3.0000
%     0.0000   -0.0000    8.7500
%     7.3750   -0.0000    8.7500
%     7.3750   -0.0000    8.7500

%    10.3750   -0.0000    8.7500
%    10.3750   -0.0000    9.7500
%    10.3750   -0.0000    7.7500
%    11.5000   -0.0000    9.7500
%    11.5000   -0.0000    7.7500
    %% YOUR CODE GOES HERE
    %pos = zeros(10, 4);
    
    world_frame= eye(4); %correct 
    A_01= world_frame* compute_dh_matrix(0, -pi/2, 3, theta1); %correct
    A_02= A_01* compute_dh_matrix(5.75, 0, 0, theta2- pi/2); %//l choose any x-axis down 
    A_03= A_02* compute_dh_matrix(7.375, 0, 0, theta3 +pi/2);
    A_04= A_03* compute_dh_matrix(0, -pi/2, 0, theta4 -pi/2);
    
    %gripper diagram
    e= 1.125;
    A_05= A_04* compute_dh_matrix(0, 0, 4.125, theta5);
    A_05_1= A_05* [0 0 -e 1]';
    A_05_2= A_05* [g/2 0 -e 1]';
    A_05_3= A_05* [-g/2 0 -e 1]';
    A_05_4= A_05* [g/2 0 0 1]';
    A_05_5= A_05* [-g/2 0 0 1]';
    
    pos= [world_frame(1:3,4)'; A_01(1:3,4)'; A_02(1:3,4)'; A_03(1:3,4)'; A_04(1:3,4)'; ...
        A_05_1(1:3)'; A_05_2(1:3)'; A_05_3(1:3)'; A_05_4(1:3)'; A_05_5(1:3)'];
end