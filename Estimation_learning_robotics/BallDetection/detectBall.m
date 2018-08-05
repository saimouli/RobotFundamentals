% Robotics: Estimation and Learning 
% WEEK 1
% 
% Complete this function following the instruction. 
function [segI, loc] = detectBall(I)
% function [segI, loc] = detectBall(I)
%
% INPUT
% I       120x160x3 numerial array 
%
% OUTPUT
% segI    120x160 numeric array
% loc     1x2 or 2x1 numeric array 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hard code your learned model parameters here
%
mu = [148.2053  143.5688   62.0533];

std_trained = [14.5230 11.7762  18.8002];

covar=[193.1341, 134.9373, -220.5312;
            134.9373, 133.2750,-180.4822;
            -220.5312, -180.4822, 340.6981];
        
thre = 8.5e-6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find ball-color pixels using your model
% 
dI = double(I);

R = dI(:,:,1);
G = dI(:,:,2);
B = dI(:,:,3);

X = [reshape(R,120*160,1) reshape(G,120*160,1) reshape(B,120*160,1)];

diff = X - mu;

for i = 1:length(diff)
    P(i) = (exp(-0.5 * diff(i,:) * inv(covar) *(diff(i,:))')) / ...
        ((2*pi)^(3/2) *(det(covar))^(0.5));
end

P_ball = reshape(P',[120 160]);
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do more processing to segment out the right cluster of pixels.
% You may use the following functions.
%   bwconncomp
%   regionprops
% Please see example_bw.m if you need an example code.
P_ball = P_ball > thre;
segI = false(size(P_ball));
CC = bwconncomp(P_ball);
numPixels = cellfun(@numel,CC.PixelIdxList);
[~,idx] = max(numPixels);
segI(CC.PixelIdxList{idx}) = true; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute the location of the ball center
%
cent = regionprops(segI,'centroid');
loc = cent.Centroid;
% segI = 
% loc = 
% 
% Note: In this assigment, the center of the segmented ball area will be considered for grading. 
% (You don't need to consider the whole ball shape if the ball is occluded.)

end
