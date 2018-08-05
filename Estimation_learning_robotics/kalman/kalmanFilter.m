function [ predictx, predicty, state, param ] = kalmanFilter( t, x, y, state, param, previous_t )
%UNTITLED Summary of this function goes here
%   Four dimensional state: position_x, position_y, velocity_x, velocity_y

    %% Place parameters like covarainces, etc. here:
    % P = eye(4)
    % R = eye(2)
    %sigma_M = diag([1e1,1e1,1e1,1e1]);
    sigma_M = diag([1e3,1e3,1e3,1e3]);
    sigma_O = diag([0.1,0.1]);

    % Check if the first time running this function
    if previous_t<0
        state = [x, y, 0, 0]';
        param.P = 0.1*eye(4);
        predictx = x;
        predicty = y;
        return;
    end

    %% TODO: Add Kalman filter updates
    % As an example, here is a Naive estimate without a Kalman filter
    % You should replace this code
    dt = 0.033;
    A = [1 0 dt 0;0 1 0 dt;0 0 1 0;0 0 0 1];
    C = [1 0 0 0;0 1 0 0];
    Z = [x y]'; R = sigma_O;
    
    %prediction step
    X = A*state;
    P = A*param.P*A' + sigma_M ;
    
    %kalman gain
    K = P * C' * inv(C*P*C'+R);
    
    %update predicted state
    state = X + K* (Z - C * X);
    param.P = P - K*C*P;
    
   
    predictx = state(1);
    predicty = state(2);
%     vx = (x - state(1)) / (t - previous_t);
%     vy = (y - state(2)) / (t - previous_t);
%     % Predict 330ms into the future
%     predictx = x + vx * 0.330;
%     predicty = y + vy * 0.330;
%     % State is a four dimensional element
%     state = [x, y, vx, vy];
end
