function MDH = GenerateMultiDH(DH, MQ, t)
%GenerateMultiDH allows to obtain the DH matrixes for the diverse positions
% of the robot joints.
% MDH is the hipermatrix of DH matrixes deifned for all the vectors of MQ
% DH is the base matrix that corresponds to the home position of the robot
% MQ is the matrix obtained by LinspaceVect(Qi, Qf, N)
% t is the vector that indicates if the joint is prismatic or rotational:
% t = 1 --> prismatic
% t = 0 --> rotational

    if nargin < 3
        t = zeros(size(DH,1));
    end

    % MDH has the same number of rows as DH, 4 columns and the same number
    % of matrixes as the number of columns in MQ
    MDH = zeros(size(DH, 1), 4, size(MQ,2));
    
    % Iterate over the number of columns in MQ
    for n = 1:size(MQ, 2)

        jn = MQ(:,n);
        
        DHn = DH;
        
        % Iterate for every row in DH
        for j = 1:size(DH, 1)
            if t(j) == 1
                 DHn(j, 3) = DH(j, 3) + jn(3);
            else
                 DHn(j, 1) = DH(j, 1) + jn(1);
            end
        end

        MDH(:, :, n) = DHn;
    end
end