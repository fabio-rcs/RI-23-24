function Q = InvKinRRR(x, y, phi, L1, L2, L3)
    %INVKIN does the inverse kinematics of the RRR planar robot.
    % x, y and phi are the coordinates of the desired point (end-effector)
    % L1, L2 and L3 are the length of each link
    % This function return all possible solutions for the desired
    % position in Q: vector with the 3 joints values with a redundancy per
    % column

    % Calculate both solutions for theta 2
    q2 = acos((x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2));

    q2 = [q2 -q2];
    
    % Calculate theta 1 for each solution of theta 2
    q1 = atan2((y*(L1 + L2*cos(q2))-x*L2*sin(q2)), ...
        (x*(L1 + L2*cos(q2))+y*L2*sin(q2)));
    
    Pwx = x - L3*cos(phi);
    Pwy = y - L3*sin(phi);
    
    % Save results in the output
    Q = [q1; q2];
end