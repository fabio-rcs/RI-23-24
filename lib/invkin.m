function Q = invkin(x, y, L1, L2)
    %INVKIN does the inverse kinematics of the RR planar robot.
    % x and y are the coordinates of the desired point
    % L1 and L2 are the length of each link
    % This function return the two possible solutions for the desired
    % position in the form of [q1A q1B q2A q2B], in radians

    % Calculate both solutions for theta 2
    q2 = acos((x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2));

    q2 = [q2 -q2];
    
    % Calculate theta 1 for each solution of theta 2
    q1 = atan2((y*(L1 + L2*cos(q2))-x*L2*sin(q2)), ...
        (x*(L1 + L2*cos(q2))+y*L2*sin(q2)));
    
    % Save results in the output
    Q = [q1; q2];
end