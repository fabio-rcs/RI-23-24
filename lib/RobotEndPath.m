function [X, Y, Z] = RobotEndPath(AAA)
    %ROBOTENDPATH  determinates the path that the robot is going to take in
    %the motion
    % AAA is the sequence of hypermatrixes calculated by
    % CalculateRobotMotion
    % [X, Y, Z] are the successive coordinates vectors of the end-effector
    % of the robot
    % The coordinates are the end of the robot. This means the 4th
    % column of the accumulated product of all the links geometric
    % transformations
    
    X = zeros(1, size(AAA, 4));
    Y = zeros(1, size(AAA, 4));
    Z = zeros(1, size(AAA, 4));

    for n = 1:size(AAA,4)
        % T = eye(4);
        AA = AAA(:,:,:,n);

        % for j = 1:size(AAA,3)
        %     T = T*AA(:,:,j);
        % end
        
        Org = LinkOrigins(AA);

        X(1,n) = Org(1,end);
        Y(1,n) = Org(2,end);
        Z(1,n) = Org(3,end);
    end

end