function seta = seta3Dy(D,L,d,f, fColor)
%SETA3DY creates a 3D arrow
% D is the size of the base lateral
% L is the length of the body
% d is the fraction between the base of the tip and D
% f is the fraction between the length of the tip and L
% fColor is the matrix with one single RGB triplet or 11 color indexes
% (one for each face)
    desloc = (D*(d-1))/2;

    Vertices = [0               0           0               % 1
                D               0           0               % 2
                D               0           D               % 3
                0               0           D               % 4
                0               L           0               % 5
                D               L           0               % 6
                D               L           D               % 7
                0               L           D               % 8
                -desloc         L           -desloc         % 9
                D+desloc        L           -desloc         % 10
                D+desloc        L           D+desloc        % 11
                -desloc         L           D+desloc        % 12
                D/2             L+(f*L)     D/2             % 13
               ];
    
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
     
    h=patch('Vertices', Vertices, 'Faces', Faces, ...
        'FaceVertexCData', fColor, 'FaceColor', 'flat');
end
