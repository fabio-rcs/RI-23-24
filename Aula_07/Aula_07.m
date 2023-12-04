% Class #7 
% Fábio Sousa
% 30/10/2023

%% Exercise 1
clearvars
close all
clc

addpath("RI-23-24\lib\");

% Variable definition
L1 = 3;
L2 = 2;
x = 2;
y = 2;

% Angle calculation
Q = invkin(x, y, L1, L2);

% Conversion to degrees
Q = rad2deg(Q) %#ok<NOPTS>

%% Exercise 2
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Variable definition
L1 = 3;
L2 = 2;
P1 = [4 0];
P2 = [-1 1];

% Calculate the angles for each point
Q1 = invkin(P1(1,1), P1(1,2), L1, L2);
Q2 = invkin(P2(1,1), P2(1,2), L1, L2);

[P, F] = seixos3(0.5);

% Number of steps of the animation
N = 50;

% Definition of the DH matrix
DH = [0 L1 0 0
      0 L2 0 0];



sd = 0.1;

for r = 1:4
    subplot(1,4,r)
    hold on
    grid on
    axis equal
    xlabel('X'); ylabel('Y')

    switch r
        case 1
            Qi = Q1(:, 2);
            Qf = Q2(:, 1);
            title('Q1B and Q2A')

        case 2
            Qi = Q1(:, 1);
            Qf = Q2(:, 2);
            title('Q1A and Q2B')

        case 3
            Qi = Q1(:, 2);
            Qf = Q2(:, 2);
            title('Q1B and Q2B')

        case 4
            Qi = Q1(:, 1);
            Qf = Q2(:, 1);
            title('Q1A and Q2A')

    end

    % Get Qi and Qf for the 1st redundancy
    % Qi = [Q1(:,1)];
    % Qf = [Q2(:,1)];
    
    MQ = LinspaceVect(Qi, Qf, N);
    MDH = GenerateMultiDH(DH, MQ);
    
    AAA = CalculateRobotMotion(MDH);
    
   
    AA = Tlinks(MDH(:,:,1));
    Org = LinkOrigins(AA);
    h = DrawLinks(Org);
    H = DrawFrames(AA, P, F);

    AnimateRobot(H, AAA, P, h, sd);
end

%% Exercise 3
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Variable definition
% Link lenghts
L1 = 4;
L2 = 2;

%Base DH matrix
DH = [0 L1 0 0
      0 L2 0 0];

% Starting configuration
Qi = invkin(4, 0, L1, L2);
% Ending configuration
Qf = invkin(-2, 2, L1, L2);

% Use redundancy 1
QQ = [Qi(:,1) Qf(:,1)];

% Fix/adjust axis
axis equal
% Hold on for graphics
hold on
grid on
% Put labels
xlabel('X')
ylabel('Y')
zlabel('Z')

% Initialize the robot
[H, h, P, AAA] = InitRobot(QQ, 50, DH);

% Press key to continue
title("Paused. Press any key")
pause
title("Testing InitRobot function")

% Do the animation
AnimateRobot(H, AAA, P, h, 0.05, 1)

%% Exercise 4 & 5
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Variable definition
% Link lenghts
L1 = 4;
L2 = 2;

%Base DH matrix
DH = [0 L1 0 0
      0 L2 0 0];
N = 50;

% Starting configuration
Qi = invkin(4, 0, L1, L2);
% Ending configuration
Qf = invkin(-2, 2, L1, L2);

% Initialize the robot with elbow up (redundancy 2)
[H, h, P, AAA] = InitRobot([Qi(:,2) Qf(:,2)], N, DH, 'sScale', 0.5);

% Fix/adjust axis and view point
axis equal
view(0, 90)

% Hold on for graphics
hold on
grid on

% Put labels
xlabel('X')
ylabel('Y')
zlabel('Z')

% Draw traject for each redundancy
for r = 1:4
    switch r
        case 1
            QQ = [Qi(:,2) Qf(:,2)];
            c = 'r-';
           
        case 2
            QQ = [Qi(:,1) Qf(:,2)];
            c = 'g-';

        case 3
            QQ = [Qi(:,2) Qf(:,1)];
            c = 'b-';

        case 4
            QQ = [Qi(:,1) Qf(:,1)];
            c = 'y-';
    end
    
    MQ = LinspaceVect(QQ(:,1), QQ(:,2), N);
    MDH = GenerateMultiDH(DH, MQ);
    
    AAA = CalculateRobotMotion(MDH);
    
    [X,Y,Z] = RobotEndPath(AAA);
    plot3(X,Y,Z,c)
end
