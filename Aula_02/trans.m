function [M] = trans(x,y,z)

% M - Matrix of homogeneous transformation
% x - translation in x
% y - translation in y
% z - translation in z

M=[ 1   0   0   x
    0   1   0   y
    0   0   1   z
    0   0   0   1];
end
