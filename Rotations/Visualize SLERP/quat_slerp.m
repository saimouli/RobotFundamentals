function [ q_int ] = quat_slerp( q0, q1, steps )
%QUAT_SLERP Perform SLERP between two quaternions and return the intermediate quaternions
%   Usage: [ q_int ] = quat_slerp( q0, q1, steps )
%   Inputs:
%       q0 is the quaternion representing the starting orientation, 1x4 matrix
%       q1 is the quaternion representing the final orientation, 1x4 matrix
%       steps is the number of intermediate quaternions required to be returned, integer value
%       The first step is q0, and the last step is q1
%   Output:
%       q_int contains q0, steps-2 intermediate quaternions, q1
%       q_int is a (steps x 4) matrix

    %% Your code goes here
    q_int = zeros(steps, 4);
    
    %since q0 and q1 are unit quat, angle is
    theta= acos(dot(q0,q1));
    
    if (2*theta>pi) % -q and q are same if theta >180
        q1=-q1;
        theta= acos(dot(q0,q1));
    end
    
    i= 0:steps-1;
    t= i./(steps-1); % time steps
    
    interQuat= ((sin((1-t').*theta))./sin(theta)).* q0 + (sin(t'.*theta)./sin(theta)).* q1; %intermediate quaternions
    
    %take the shortest path
    % q = -q so if theta is >than pi use -q
    %output 
    q_int= interQuat;
    
end