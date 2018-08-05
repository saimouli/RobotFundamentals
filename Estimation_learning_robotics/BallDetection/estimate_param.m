function [mu,covariance] = estimate_param(R,G,B)
%ESTIMATE_PARAM calculated mu and covarince matrix 
%   given r g and b input 
R = double(R);
G = double(G);
B = double(B);

mu = [mean(R) mean(G) mean(B)];

covariance = [var(R) (std(R)*std(G)) (std(R)*std(B))
               (std(R)*std(G))   var(G)  (std(G)*std(B))
               (std(R)*std(B))   (std(G)*std(B)) var(B)];
    
end

