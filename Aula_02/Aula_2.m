%% Ex 1 ------------------------------------------------------------------- 
% Triangle creation and translation

clearvars;
close all;
clc;

addpath("RI-23-24\lib\")

P1 = [-1 0 0]';
P2 = [1 0 0]';
P3 = [0 2 0]';
A1 = [P1 P2 P3];

% Add a line of ones after the last coordinate
A1 = [A1; ones(1, size(A1, 2))]; 

h = fill3(A1(1,:), A1(2,:), A1(3,:), 'y');
xlabel('X'), ylabel('Y'), zlabel('Z')

hold on, grid on, axis equal, axis([-5 5 -5 5 -5 5])

NN = 1000;
tt=linspace(0,1,NN);

% Function to rotate 2x around 'x' axis
for t=tt
    T=rotx(t*4*pi);
    A2=T*A1;
    h.XData=A2(1,:);
    h.YData=A2(2,:);
    h.ZData=A2(3,:);
    pause(1/NN)
end

hold off

% while 1
%     for t=tt %instead of t=1:NN
%         T=roty(t*10*pi)*rotx(t*20*pi); %%BE creative
%         A2=T*A1;
% 
%         h.XData=A2(1,:);
%         h.YData=A2(2,:);
%         h.ZData=A2(3,:);
% 
%         pause(1/NN);
%     end
% end

%% Exercise 2
clearvars
close all
clc

addpath("RI-23-24\lib\")


P=[ 0.5   0.5    1    0   -1    -0.5   -0.5
    0     2      2    3    2    2      0
    0     0      0    0    0    0      0
    1     1      1    1    1    1      1  ];

% Arrow visualization
h = fill3(P(1,:), P(2,:), P(3,:), 'm');
xlabel('X'), ylabel('Y'), zlabel('Z')

hold on, grid on, axis equal, axis([-5 5 -5 5 -5 5])

% Simmetry Line drawing
line([0 5], [0 0], [0 0]);
line([0 0], [0 5], [0 0]);
line([0 0], [0 0], [0 5]);

% Rotation of original arrow so that there's one
% on each line
P2 = rotz(-pi/2)*roty(pi/2)*P;
fill3(P2(1,:), P2(2,:), P2(3,:), 'r');

P3 = rotx(pi/2)*roty(pi/2)*P;
fill3(P3(1,:),P3(2,:),P3(3,:),'y');

view(120,30)
hold off
%% Exercise 3
% Once at a time rotation

clearvars
close all
clc

addpath("RI-23-24\lib\")


P1=[0.5   0.5    1    0   -1    -0.5   -0.5
    0     2      2    3    2    2      0
    0     0      0    0    0    0      0
    1     1      1    1    1    1      1  ];

% Arrow visualization
h1 = fill3(P1(1,:), P1(2,:), P1(3,:), 'm');
xlabel('X'), ylabel('Y'), zlabel('Z')

hold on, grid on, axis equal, axis([-5 5 -5 5 -5 5])

% Simmetry Line drawing and coloring accordingly
l1 = line([0 5], [0 0], [0 0]);
l2 = line([0 0], [0 5], [0 0]);
l3 = line([0 0], [0 0], [0 5]);

l1.Color = 'r';
l2.Color = 'm';
l3.Color = 'y';

% Rotation of original arrow so that there's one
% on each line
P2 = rotz(-pi/2)*roty(pi/2)*P1;
h2 = fill3(P2(1,:), P2(2,:), P2(3,:), 'r');

P3 = rotx(pi/2)*roty(pi/2)*P1;
h3=fill3(P3(1,:),P3(2,:),P3(3,:),'y');

view(120,30)

NN1 = 500;
NN2 = 250;
NN3 = 100;
tt1=linspace(0,1,NN1);
tt2=linspace(0,1,NN2);
tt3=linspace(0,1,NN3);

data = ({'P1', 'x line', 'y line', 'z line', 'P2', 'P3'});
legend(data)
title('Arrow rotation')

% Functions to rotate arrows around their axis
% P1 rotation around y
for t1=tt1
    Q1=roty(t1*20*pi)*P1;
    h1.XData=Q1(1,:);
    h1.YData=Q1(2,:);
    h1.ZData=Q1(3,:);
    pause(1/NN1)
end

% P2 rotation around x
for t2=tt2
    Q2=rotx(t2*10*pi)*P2;
    h2.XData=Q2(1,:);
    h2.YData=Q2(2,:);
    h2.ZData=Q2(3,:);
    pause(1/NN2)
end

% P3 rotation around z
for t3=tt3
    Q3=rotz(t3*10*pi)*P3;
    h3.XData=Q3(1,:);
    h3.YData=Q3(2,:);
    h3.ZData=Q3(3,:);
    pause(1/NN3)
end


hold off

%% Exercise 3 
% Same time rotation

clearvars
close all
clc

addpath("RI-23-24\lib\")

P1=[ 0.5   0.5    1    0   -1    -0.5   -0.5
    0     2      2    3    2    2      0
    0     0      0    0    0    0      0
    1     1      1    1    1    1      1  ];

% Arrow visualization
h1 = fill3(P1(1,:), P1(2,:), P1(3,:), 'm');
xlabel('X'), ylabel('Y'), zlabel('Z')

hold on, grid on, axis equal, axis([-5 5 -5 5 -5 5])

% Simmetry Line drawing and coloring accordingly
l1 = line([0 5], [0 0], [0 0]);
l2 = line([0 0], [0 5], [0 0]);
l3 = line([0 0], [0 0], [0 5]);

l1.Color = 'r';
l2.Color = 'm';
l3.Color = 'y';

% Rotation of original arrow so that there's one
% on each line
P2 = rotz(-pi/2)*roty(pi/2)*P1;
h2 = fill3(P2(1,:), P2(2,:), P2(3,:), 'r');

P3 = rotx(pi/2)*roty(pi/2)*P1;
h3=fill3(P3(1,:),P3(2,:),P3(3,:),'y');

view(120,30)

NN = 500;
tt=linspace(0,1,NN);

data = ({'P1', 'x line', 'y line', 'z line', 'P2', 'P3'});
legend(data)
title('Arrow rotation')

% Functions to rotate arrows around their axis
% Arrows rotation at different speeds (x1, x2, x3)

for t=tt
    Q1=roty(t*30*pi)*P1;
    h1.XData=Q1(1,:);
    h1.YData=Q1(2,:);
    h1.ZData=Q1(3,:);

    Q2=rotx(t*20*pi)*P2;
    h2.XData=Q2(1,:);
    h2.YData=Q2(2,:);
    h2.ZData=Q2(3,:);

    Q3=rotz(t*10*pi)*P3;
    h3.XData=Q3(1,:);
    h3.YData=Q3(2,:);
    h3.ZData=Q3(3,:);
    pause(1/NN)
end

hold off

%% Exercise 4
clearvars
close all
clc

addpath("RI-23-24\lib\")

P1=[ 0.5   0.5    1    0   -1    -0.5   -0.5
    0     2      2    3    2    2      0
    0     0      0    0    0    0      0
    1     1      1    1    1    1      1  ];

% Arrow visualization
h1 = fill3(P1(1,:), P1(2,:), P1(3,:), 'm');
xlabel('X'), ylabel('Y'), zlabel('Z')

hold on, grid on, axis equal, axis([-5 5 -5 5 -5 5])

M = [0  0  4    0      0      0
     0  0  0  -pi/2    0      0
     0  0  5    0      0      0
     0  0  0    0    -pi/2    0];

D1 = M(1,:);
D2 = M(2,:);
D3 = M(3,:);
D4 = M(4,:);

P0 = eye(4);
N = 50;

P0 = Animate(h1, P1, P0, D1, N);
P0 = Animate(h1, P1, P0, D2, N);
P0 = Animate(h1, P1, P0, D3, N);
P0 = Animate(h1, P1, P0, D4, N);
