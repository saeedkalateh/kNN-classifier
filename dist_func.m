function distance = dist_func(a,b)
% Calculate the Euclidean distance
% With no square root for less computation
%
% distance = dist_func(a,b)
%
% a and b are vectors with arbitrary dimensions

xy_dist=a-b;
xy_dist=xy_dist.^2;
distance=sum(xy_dist);
