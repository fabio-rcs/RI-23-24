function AAA = CalculateRobotMotion(MDH)
%CALCULATEROBOTMOTION is a function that calculates the motion of all the
%links of the robot. Basically, it puts all the links transformations
%associated with MDH inside a supermatrix 
% AAA is the supermatrix with all the hypermatrixes that calculate the 
% transformations for all the links of the DH matrix
    
    % Add the folder with necessary functions to MATLAB path
    addpath("RI-23-24\lib\")
    
    % Prealocate memory for the superhypermatrix 
    AAA = zeros(4,4,size(MDH, 1), size(MDH, 3));
    
    % For each step, calculate AA and store it inside AAA
    for k = 1:size(MDH, 3)
        DH = MDH(:,:,k);
        AA = Tlinks(DH);
        AAA(:,:,:,k) = AA;
    end
end