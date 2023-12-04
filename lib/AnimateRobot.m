function AnimateRobot(H, AAA, P, h, sd, plotpath)
%ANIMATEROBOT is a function animates the movement of the robot
% H is the graphic handles of the objects to animate
% AAA is the superhypermatrix that contains the temporal sequence of
% hypermatrixes calculated by CalculateRobotMotion
% P is the objet to represent (coordinate system: seixos3). The purpose is
% to dinamically recalculate it's posture for the representation
% h is the graphic handle of the links of the robot
% sd is the indicator of the pause level between the steps of the animation
% ( controls the animation speed)
% plotpath boolean that defines if path will be drawn. True by default.
    
    % plotpath is true by default
    if nargin < 6
        plotpath = true;
    end

    addpath("RI-23-24\lib\")
    
    for k = 1:size(AAA, 4)
        AA = AAA(:,:,:,k);
        T = eye(4);
     
        for j = 1:size(AA,3)
            T = T*AA(:,:,j);
            Pn = T*P;
            set(H(j+1), 'Vertices', Pn(1:3,:)')
        end
        
        Org = LinkOrigins(AA);
        set(h, 'XData',Org(1, :), 'YData', Org(2, :), ...
            'ZData', Org(3, :))
        
        if plotpath
            plot3(Org(1,end), Org(2, end), Org(3, end), '.r', ...
                'MarkerSize', 10)
        end

        pause(sd)
    end
end