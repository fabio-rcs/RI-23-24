% Class #5 script

%% Exercise 1
clearvars
close all
clc

addpath("lib\")

% Definition of inicial and final values as well
% as the number of elements of linspace
Qi = [1 3 -2]';
Qf = [4 0 -8]';
N = 4;

MQ = LinspaceVect(Qi, Qf, N);

plot(MQ')

%% Exercise 2
clearvars
close all
clc

addpath("lib\")

% Vectors definition
QA = [1 3 -2]';
QB = [4 0 -4]';
QC = [3 5 0]';
QD = [6 -1 3]';

N = 4;

% Linspace between each vectors
MQAB = LinspaceVect(QA, QB, N);
MQBC = LinspaceVect(QB, QC, N);
MQCD = LinspaceVect(QC, QD, N);

% Concatenation of all step matrixes
MQa = [MQAB MQBC MQCD];

% Plot visualization of result
subplot(1,2,1)
plot(MQa')
hold on

% Elimination of repeated values and visualization
MQb = [MQAB(:, 1:(end-1)) MQBC(:, 1:(end-1)) MQCD];
subplot(1,2,2)
plot(MQb')

%% Exercise 3 & 4
clearvars
close all
clc

addpath("lib\")

L1 = 2;
L2 = 1;
Qi = [0 0]';
Qf = [pi/3 pi/3]';
N = 7;

DH = [0 L1 0 0
      0 L2 0 0];

MQ = LinspaceVect(Qi, Qf, N);
MDH = GenerateMultiDH(DH, MQ);

figure
hold on
grid on
axis equal

[P, F] = seixos3(0.2);

Color = ['b' 'r'];

for k = 1:size(MDH, 3)
 
    AA = Tlinks(MDH(:,:,k));
    Org = LinkOrigins(AA);
    h = DrawLinks(Org);
    H = DrawFrames(AA, P, F, Color);
end

hold off

%% Exercise 5
clearvars
close all
clc

addpath("lib\")

L1 = 1;
L2 = L1;
d3max = 1;

DH = [0     0          L1  0
      0     L2         0   pi/2
      0     L2+d3max   0   0];

theta = deg2rad(60);

Qi = [0 0 0]';
Qf = [0 theta 1]';

N=5;

t = [0 0 1];

MQ = LinspaceVect(Qi, Qf, N);
MDH = GenerateMultiDH(DH, MQ, t);

figure
hold on
grid on
axis equal

xlabel('X'); ylabel('Y'); zlabel('Z');
view(25,30)

[P, F] = seixos3(0.2);

Color = ['b' 'r' 'g'];

for k = 1:size(MDH, 3)
 
    AA = Tlinks(MDH(:,:,k));
    Org = LinkOrigins(AA);
    h = DrawLinks(Org);
    H = DrawFrames(AA, P, F, Color);
end

hold off