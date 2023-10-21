function [R] = rotz(theta)
% R - Matrix of homogeneous transformation
% theta - angle of rotation

    R = [cos(theta) -sin(theta) 0   0
         sin(theta) cos(theta)  0   0
         0          0           1   0
         0          0           0   1];
end