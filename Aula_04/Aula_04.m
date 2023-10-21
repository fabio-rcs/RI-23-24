%% Exercício 1, 2a, 2b e 3
clearvars
close all
clc

addpath("lib\")

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
view(0,90)
axis square
title('Links of the robot')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P, F] = seixos3(0.5);
axis equal

% Color matrix for each point's axis
Color = ['g' 'g' 'g'];

% Drawing
h2 = DrawFrames(AA, P, F, Color);

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
view(0,90)
axis square
title('Links of the robot RR')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RR, F_RR] = seixos3(1);
axis equal
h2_RR = DrawFrames(AA_RR, P_RR, F_RR, Color);

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
view(0,90)
axis square
title('Links of the robot RRR')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RRR, F_RRR] = seixos3(1);
axis equal
h2_RRR = DrawFrames(AA_RRR, P_RRR, F_RRR, Color);

% --------------------------------------------------------
% DH_RR3D
% -------------------------------------------------------

% Define DH_RR3D matrix
DH_RR3D = [0     0      3   pi/2
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
h2_RR3D = DrawFrames(AA_RR3D, P_RR3D, F_RR3D, Color);

% --------------------------------------------------------
% DH_RR3D
% -------------------------------------------------------

% Define DH_RR3D matrix
DH_RRR3D = [0     0      3   pi/2
            0     2      0   0
            0     2      0   0];

% Get the transformation matrix AA0
AA_RRR3D = Tlinks(DH_RRR3D);

% Get the origins of each link
Org_RRR3D = LinkOrigins(AA_RRR3D);

% Draw the ilustration of the robot links
subplot(2,3,6)
h_RRR3D = DrawLinks(Org_RRR3D);
grid on
axis square
title('Links of the robot RRR 3D')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RRR3D, F_RRR3D] = seixos3(1);
axis equal
h2_RRR3D = DrawFrames(AA_RRR3D, P_RRR3D, F_RRR3D, Color);

%% Exercício 5

clearvars
close all
clc

addpath("lib\")

% Define DH_RRR antropromorph matrix
DH_RRRantro = [0     0      3   pi/2
               pi/4  3      0   0 
              -pi/4  2      0   0];

% Color matrix
ColorRRRantro = ['b' 'g' 'r'];

% Get the transformation matrix AA0
AA_RRRantro = Tlinks(DH_RRRantro);

% Get the origins of each link
Org_RRRantro = LinkOrigins(AA_RRRantro);

% Draw the ilustration of the robot links
h_RRRantro = DrawLinks(Org_RRRantro);
grid on
view(38,19)
axis square
title('Links of the robot RRR Antropormophic')
xlabel('X'); ylabel('Y'); zlabel('Z');

% Show the referencial of each link
hold on
[P_RRRantro, F_RRRantro] = seixos3(1);
axis equal
h2_RRRantro = DrawFrames(AA_RRRantro, P_RRRantro, F_RRRantro, ColorRRRantro);

%% Exercício 6
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Variable definition
D = 0.02;
L = 100;
d = 1.25;
f = 0.3;
fColor = [1 1 0];

% Function call to draw a 3D arrow
seta3Dy(D,L,d,f, fColor)

% Display personalization
hold on
title('3D arrow')
xlabel('X'), ylabel('Y'), zlabel('Z')
axis square
grid on

view(135,20)

%% Exercício 7

clearvars
close all
clc

addpath("lib\")

% Variable definition 
D = 0.02;
L = 1;
d = 2;
f = 0.15;
fColor = {[1 0 0], [0 1 0], [0 0 1]};

% Function call to draw the 3D axis arrows
setas3D(D,L,d,f, fColor)

% Graphic personalization
hold on
xlabel('X'), ylabel('Y'), zlabel('Z')
title('3D axis arrows')
axis square
grid on
view(135,20)