%% Exercício 1, 2a, 2b e 3
clearvars
close all
clc

% Define DH matrix
DH = [-pi/4     1       0   0
       pi/2     1.5     0   0
      -pi/3     0.5     0   0];

% Get the transformation matrix AA
AA = Tlinks(DH);

% Get the origins of each link
Org = LinkOrigins(AA);

% Draw the ilustration of the robot links
subplot(2,3,1)
h = DrawLinks(Org);
grid on
axis square
title('Links of the robot')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P, F] = seixos3(0.2);
axis equal
h2 = DrawFrames(AA, P, F);

% -------------------------------------------------------
% DH_RR
% -------------------------------------------------------

% Define DH_RR matrix
DH_RR = [0     3       0   0
         0     2       0   0
         0     0       0   0];

% Get the transformation matrix AA
AA_RR = Tlinks(DH_RR);

% Get the origins of each link
Org_RR = LinkOrigins(AA_RR);

% Draw the ilustration of the robot links
subplot(2,3,2)
h_RR = DrawLinks(Org_RR);
grid on
axis square
title('Links of the robot RR')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RR, F_RR] = seixos3(1);
axis equal
h2_RR = DrawFrames(AA_RR, P_RR, F_RR);

% --------------------------------------------------------
% DH_RRR
% -------------------------------------------------------

% Define DH_RRR matrix
DH_RRR = [0     3       0   0
          0     2       0   0
          0     2       0   0];

% Get the transformation matrix AA
AA_RRR = Tlinks(DH_RRR);

% Get the origins of each link
Org_RRR = LinkOrigins(AA_RRR);

% Draw the ilustration of the robot links
subplot(2,3,3)
h_RRR = DrawLinks(Org_RRR);
grid on
axis square
title('Links of the robot RRR')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RRR, F_RRR] = seixos3(1);
axis equal
h2_RRR = DrawFrames(AA_RRR, P_RRR, F_RRR);

% --------------------------------------------------------
% DH_RR3D
% -------------------------------------------------------

% Define DH_RR3D matrix
DH_RR3D = [pi/2  3      0   0
           0     2      0   0
           0     0      0   0];

% Get the transformation matrix AA0
AA_RR3D = Tlinks(DH_RR3D);

% Get the origins of each link
Org_RR3D = LinkOrigins(AA_RR3D);

% Draw the ilustration of the robot links
subplot(2,3,5)
h_RR3D = DrawLinks(Org_RR3D);
grid on
axis square
title('Links of the robot RR 3D')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RR3D, F_RR3D] = seixos3(1);
axis equal
h2_RR3D = DrawFrames(AA_RR3D, P_RR3D, F_RR3D);