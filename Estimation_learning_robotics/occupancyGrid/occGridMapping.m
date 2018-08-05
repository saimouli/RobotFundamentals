% Robotics: Estimation and Learning 
% WEEK 3
% 
% Complete this function following the instruction. 
function myMap = occGridMapping(ranges, scanAngles, pose, param)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Parameters 
% 
% the number of grids for 1 meter.
myResol = param.resol;
% the initial map size in pixels
myMap = zeros(param.size);
% the origin of the map in pixels
myorigin = param.origin; 
 
% Log-odd parameters 
lo_occ = param.lo_occ;
lo_free = param.lo_free; 
lo_max = param.lo_max;
lo_min = param.lo_min;

myMap(param.origin(2),param.origin(1)) = 3;

N = size(pose,2);
K = size(ranges,1);
for j = 1:N % for each time,
    
    % Find grids hit by the rays (in the gird map coordinate)
    % real location
    x_occ = ranges(:,j).*cos(scanAngles+pose(3,j)) + pose(1,j);
    y_occ = -ranges(:,j).*sin(scanAngles+pose(3,j)) + pose(2,j);
    
    %i_origin = ceil(myResol * [pose(1,j), pose(2,j)]);
    
    % grid indicies
    i_x = ceil(myResol * x_occ);
    i_y = ceil(myResol * y_occ);
   
    % pose in grid coordinates
    pos_grid_x = ceil(myResol * pose(1,j));
    pos_grid_y = ceil(myResol * pose(2,j));
    
%     if j==503
%         pause
%     end
    for i = 1:K
     
        if i==503 && j==503
            pause
        end
        % Find occupied-measurement cells and free-measurement cells
        [freex, freey] = bresenham(pos_grid_x,pos_grid_y,i_x(i),i_y(i));
        
        free = sub2ind(size(myMap),freey + myorigin(2),freex + myorigin(1));
        occ = sub2ind(size(myMap),i_y(i) + myorigin(2),i_x(i) + myorigin(1)); 
        % Update the log-odds
        myMap(occ) = myMap(occ) + lo_occ;
        myMap(free) = myMap(free) - lo_free;
        

    end
    % Visualize the map as needed
%     myMap(free) = 2;
%     myMap(occ) = 1;

end
   % Saturate the log-odd values
    myMap(myMap < lo_min) = lo_min;
    myMap(myMap > lo_max) = lo_max;
    
end