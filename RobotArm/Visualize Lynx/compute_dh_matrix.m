%Author: Saimouli Katragadda
%Email: skatraga@umd.edu
%%
function A = compute_dh_matrix(r, alpha, d, theta)
   
    A= [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) r*cos(theta)
        sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) r*sin(theta)
        0           sin(alpha)             cos(alpha)              d
        0              0                      0                    1
        ];
    
end

%can use these to Test the function
% r = 5;
% alpha = 0;
% d = 3;
% theta = pi/2;
% A = compute_dh_matrix(r, alpha, d, theta)