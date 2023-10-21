function seta = setas3D(D,L,d,f, fColor)
%SETA3DY creates a 3D arrow
% D is the size of the base lateral
% L is the length of the body
% d is the fraction between the base of the tip and D
% f is the fraction between the length of the tip and L
% fColor is the matrix with one single RGB triplet or a cell array with
% 3 different color matrixes

    desloc = (D*(d-1))/2;

    VerticeX = [0               0           0              0 % 1
                0               D           0              0 % 2
                0               D           D              0 % 3
                0               0           D              0 % 4
                L               0           0              0 % 5
                L               D           0              0 % 6
                L               D           D              0 % 7
                L               0           D              0 % 8
                L         -desloc           -desloc        0 % 9
                L        D+desloc           -desloc        0 % 10
                L        D+desloc           D+desloc       0 % 11
                L         -desloc           D+desloc       0 % 12
                L+(f*L)         D/2         D/2            0 % 13
                0               0           0              1 ]; % Delete 
    % last row and column after calculations
    
    % Rotate X axis arrow to become Z axis arrow
    VerticeZ = zeros(size(VerticeX));

    for i = 1:size(VerticeX, 1)
        T = roty(pi/2);
        VerticeZ(i,:) = VerticeX(i,:)*T;
    end
    
    % Rotate X axis arrow to become Y axis arrow
        VerticeY = zeros(size(VerticeX));

    for i = 1:size(VerticeX, 1)
        T = rotz(-pi/2);
        VerticeY(i,:) = VerticeX(i,:)*T;
    end
    
    % Deletion of extra row and column
    VerticeZ(14,:) = [];
    VerticeZ(:,4) = [];
    VerticeX(14,:) = [];
    VerticeX(:,4) = [];
    VerticeY(14,:) = [];
    VerticeY(:,4) = [];

    % Face definition
    Faces = [   1   2   3   4   % Face 1
                2   6   7   3   % Face 2
                3   4   8   7   % Face 3
                1   4   8   5   % Face 4
                1   5   6   2   % Face 5
                5   6   7   8   % Face 6
                9   10  11  12  % Face 7
                9   10  13  13  % Face 8
                10  11  13  13  % Face 9
                12  11  13  13  % Face 10
                12  9   13  13  % Face 11
             ];

    % Color extraction
    fColorX = fColor{1};
    fColorY = fColor{2};
    fColorZ = fColor{3};
    
    % X axis arrow path
    patch('Vertices', VerticeX, 'Faces', Faces, ...
        'FaceVertexCData', fColorX, 'FaceColor', 'flat');
    
    % Y axis arrow path
    patch('Vertices', VerticeY, 'Faces', Faces, ...
        'FaceVertexCData', fColorY, 'FaceColor', 'flat');
    
    % Z axis arrow patch
    patch('Vertices', VerticeZ, 'Faces', Faces, ...
        'FaceVertexCData', fColorZ, 'FaceColor', 'flat');
end
