function [H, h, P, AAA] = InitRobot(QQ, NN, DH, jTypes, sScale)
    %INITROBOT accepts the base elements to return graphic handles and the
    %calculation of the motion for the animation and other simulation
    %operations. This function facilitates the procedures of preparation
    %and initial representation of the robot.
    % QQ is the column matrix of the joints positions (minimum 2)
    % NN is the number of points of each segment of the motion
    % DH is the base matrix of the cinematic parameters
    % jTypes is the vector with the type of joints (0=rot, 1=prism;
    % optional)
    % sScale is the scale factor of seixos3() (1 by default)
    % Returns:
    % H - graphic handle of the axis
    % h - graphic handle of the robot links
    % P is the object from seixos3() in the chosen scale
    % AAA is the superhypermatrix with the transformations of the robot's 
    % positions 

    addpath("RI-23-24\lib\")

    Qi = QQ(:,1);
    Qf = QQ(:,2);
    MQ = LinspaceVect(Qi, Qf, NN);

    if ~exist('jTypes', 'var')
        MDH = GenerateMultiDH(DH, MQ);
    else
        MDH = GenerateMultiDH(DH, MQ, jTypes);
    end
    
    if ~exist('sScale', 'var')
        [P, F] = seixos3(1);
    else
        [P, F] = seixos3(sScale);
    end

    AAA = CalculateRobotMotion(MDH);
    AA = Tlinks(MDH(:,:,1));
    Org = LinkOrigins(AA);
    h = DrawLinks(Org);
    H = DrawFrames(AA, P, F);
end