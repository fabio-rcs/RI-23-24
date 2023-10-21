%% Ex 1 ------------------------------------------------------------------- 
% Triangle creation and translation
clearvars;
close all;
clc;

addpath("lib\")

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';

A1 = [P1 P2 P3];

fill(A1(1,:), A1(2,:), 'y');

axis([-10 10 -10 10]);

axis square
grid on

hold on % To draw on top of the existing figure. 
% If not, MatLab deletes previous figure and creates a new one

v = [5 0]';

A2 = A1 + v;

fill(A2(1,:), A2(2,:), 'r');


%% Ex 2 -------------------------------------------------------------------

A3 = rot(deg2rad(50))*A2;

h = fill(A3(1,:), A3(2,:), 'b');

N = 50;

for r = linspace(60, 350, N)

    An = rot(deg2rad(r))*A2;
    %fill(An(1,:), An(2,:), );
    h.Vertices = An';
    pause(0.01)    
end

%% Ex 3 -------------------------------------------------------------------
clearvars
close all
clc

addpath("lib\")

P1 = [-1 0 1]';
P2 = [1 0 1]';
P3 = [0 2 1]';

A1 = [P1 P2 P3];

h = fill(A1(1,:), A1(2,:), 'r');
hold on
axis([-10 10 -10 10]);

axis square
grid on

N = 50;


for n = linspace(0, 1, N)
    
    t1 = transGeom(3*n, 4*n, 0);
    An = t1*A1;
    h.Vertices = An';
    h.FaceColor=[round(rand(1)) round(rand(1)) round(rand(1))];
    pause(0.05)
end

for n = linspace(0, 1, N)
    
    t2 = transGeom(0, 0, deg2rad(80*n));
    An2 = t2*An;
    h.Vertices = An2';
    h.FaceColor=[round(rand(1)) round(rand(1)) round(rand(1))];
    pause(0.05)    
end

for n = linspace(0, 1, N)
    
    t3 = transGeom(2*n, -5*n, 0);
    An3 = t3*An2;
    h.Vertices = An3';
    h.FaceColor=[round(rand(1)) round(rand(1)) round(rand(1))];
    pause(0.05)    
end

%% Ex 4a ------------------------------------------------------------------
clearvars
close all
clc

addpath("lib\")

P1 = [0 -1/2 1]';
P2 = [2 0 1]';
P3 = [0 1/2 1]';

A1 = [P1 P2 P3];

h = fill(A1(1,:), A1(2,:), 'r');
hold on
axis([-10 10 -10 10]);

axis square
grid on

M = [ 0     0      deg2rad(154)
      -4    2      deg2rad(180)
      -6    0      deg2rad(270) ];
N = 50;

AnimateSimple2D(h, A1, M, N)

%% Ex 5 ---------------------------------------------
clearvars
close all
clc

addpath("lib\")

P1 = [0 -1/2 1]';
P2 = [2 0 1]';
P3 = [0 1/2 1]';

A1 = [P1 P2 P3];

h = fill(A1(1,:), A1(2,:), 'r');
hold on
axis([-10 10 -10 10]);
axis square
grid on

M = [ 0     0      deg2rad(135)
     -4     2      deg2rad(180)
     -6     0      deg2rad(270)
     -4    -2      deg2rad(360)
      0     0      deg2rad(405)
      4     2      deg2rad(360)
      6     0      deg2rad(270)
      4    -2      deg2rad(180)
      0     0      deg2rad(135)];
N = 50;

AnimateSimple2D(h, A1, M, N)