%% Class #6
% Fábio Sousa
% 23-10-2023

%% Exercise 1 & 2
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Test the function
DH = [ 0 3 0 0
       0 2 0 0 ];

Qi = [0 0]';
Qf = [pi/2 -pi/2]';

N = 500;

MQ = LinspaceVect(Qi, Qf, N);
MDH = GenerateMultiDH(DH, MQ);

AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.5);

figure
hold on
grid on
axis equal
xlabel('X'); ylabel('Y'); zlabel('Z');

AA = Tlinks(MDH(:,:,1));
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);
sd = 0.01;

AnimateRobot(H, AAA, P, h, sd);

%% Exercise 3
clearvars
close all
clc

addpath("RI-23-24\lib\")

L1 = 2;
L2 = 2;
L3 = 1;

Qi = [ 0     0      0    ]';
QA = [ pi/2  pi/4  -pi/4 ]';
Qf = [ 0    -pi/4   pi/4 ]';

DH = [ 0  0   L1 pi/2
       0  L2  0  0
       0  L3  0  0    ];

N = 250;

MQ1 = LinspaceVect(Qi, QA, N);
MDH1 = GenerateMultiDH(DH, MQ1);
AAA1 = CalculateRobotMotion(MDH1);

MQ2 = LinspaceVect(QA, Qf, N);
MDH2 = GenerateMultiDH(DH, MQ2);
AAA2 = CalculateRobotMotion(MDH2);

[P, F] = seixos3(0.5);

figure
hold on
grid on
axis equal
xlabel('X'); ylabel('Y'); zlabel('Z');
view(25,30)

AA1 = Tlinks(MDH1(:,:,1));
Org1 = LinkOrigins(AA1);
h1 = DrawLinks(Org1);
H1 = DrawFrames(AA1, P, F);
sd = 0.01;

AnimateRobot(H1, AAA1, P, h1, sd);

AA2 = Tlinks(MDH2(:,:,1));
Org2 = LinkOrigins(AA2);

% There's no need to draw frames and axis again
%h2 = DrawLinks(Org2);
%H2 = DrawFrames(AA2, P, F);

% We'll use the same frames and links 
AnimateRobot(H1, AAA2, P, h1, sd);

%% Exercise 4
clearvars
close all
clc

addpath("RI-23-24\lib\")

LA = 2;
LB = 2;
LC = 1;
LD = 0.1;

Qi = [ 0        0       0   0   ]';
Qf = [ pi/2     -pi/4   2   pi/6]';

DH = [ 0  LB  LA pi
       0  LC  0  0
       0  0   0  0
       0  0   LD 0];

N = 250;

MQ = LinspaceVect(Qi, Qf, N);
MDH = GenerateMultiDH(DH, MQ);
AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.5);

figure
hold on
grid on
axis equal
xlabel('X'); ylabel('Y'); zlabel('Z');
view(25,30)

AA = Tlinks(MDH(:,:,1));
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);
sd = 0.01;

% Go to Qf
AnimateRobot(H, AAA, P, h, sd);

MQ2 = LinspaceVect(Qf, Qi, N);
MDH2 = GenerateMultiDH(DH, MQ2);
AAA2 = CalculateRobotMotion(MDH2);
AA2 = Tlinks(MDH2(:,:,1));
Org2 = LinkOrigins(AA2);

% Back to Qi
AnimateRobot(H, AAA2, P, h, sd);
