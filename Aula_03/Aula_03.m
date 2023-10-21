%% Exercício 1

clearvars
close all
clc

addpath("RI-23-24\lib\")

[P, F] = seixos3();

patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'g')
axis([-1 6 -1 6 -1 6])
xlabel('X'), ylabel('Y'), zlabel('Z')
axis square
grid on

view(135,20)

% A ordem em que as transformações são feitas importa
T1 = trans(0,0,5)*rotx(-pi/2);
%T1 = rotx(-pi/2)*trans(0,-5,0);

P1 = T1*P;
patch('Vertices', P1(1:3,:)', 'Faces', F, 'FaceColor', 'b')

T2 = T1*trans(0,0,4)*roty(pi/2);

P2 = T2*P;
patch('Vertices', P2(1:3,:)', 'Faces', F, 'FaceColor', 'b')

T3 = T2*trans(0,0,4)*rotx(-pi/2);

P3 = T3*P;
patch('Vertices', P3(1:3,:)', 'Faces', F, 'FaceColor', 'b')

T4 = T3*trans(0,0,5)*roty(pi/2);

P4 = T4*P;
patch('Vertices', P4(1:3,:)', 'Faces', F, 'FaceColor', 'b')

T5 = T4*trans(0,0,4)*rotx(-pi/2);

P5 = T5*P;
patch('Vertices', P5(1:3,:)', 'Faces', F, 'FaceColor', 'b')

%% Exercício 2, 3, 4 e 5
clearvars
close all
clc

addpath("RI-23-24\lib\")

[P, F] = seixos3();

h = patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'g');
axis([-1 6 -1 6 -1 6])
xlabel('X'), ylabel('Y'), zlabel('Z')
axis square
grid on

view(135,20)

NN=10;
T(:,:,:,1) = mtrans(0,0,linspace(0,5,NN));
T(:,:,:,2) = mrotx(linspace(0,-pi/2,NN));
T(:,:,:,3) = mtrans(0,linspace(0,6,NN),0);
T(:,:,:,4) = mroty(linspace(0,pi/2,NN));
T(:,:,:,5) = mtrans(linspace(0,4,NN),0,0);
T(:,:,:,6) = mrotx(linspace(0,-pi/2,NN));
T(:,:,:,7) = mtrans(0,0,linspace(0,-5,NN));
T(:,:,:,8) = mroty(linspace(0,pi/2,NN));
T(:,:,:,9) = mtrans(0,linspace(0,-6,NN),0);
T(:,:,:,10) = mrotx(linspace(0,-pi/2,NN));
T(:,:,:,11) = mtrans(linspace(0,-4,NN),0,0);
T(:,:,:,12) = mroty(linspace(0,pi/2,NN));
order=[0 1 0 1 0 1 0 1 0 1 0 1];
Tcurr=eye(4,4);

for n=1:size(T,4)
    Tcurr = manimate(h,P,Tcurr, T(:,:,:,n), order(n));
    pause(1)
end

%% Exercício 6, 7 e 8
clearvars
close all
clc

addpath("RI-23-24\lib\")

% Definition of vertices
points = [
            1  -1   0       %point 1
            1   1   0       %point 2
           -1   1   0       %point 3
           -1  -1   0       %point 4
            0   0   2       %point 5
                        ];

% Homogeneous version for transformations
hpoints=[points';ones(1,size(points,1))];

% Definition of faces
Faces1 = [
            1   2   5   5   %face1
            2   3   5   5   %face2
            3   4   5   5   %face3
            4   1   5   5   %face4
            1   2   3   4   %face5
                            ];
% Simple color index to paint the faces
fColor= [ 1 2 3 4 5 ]';


h=patch('Vertices', points, 'Faces', Faces1, ...
    'FaceVertexCData', fColor, 'FaceColor', 'flat');

axis([-10 10 -10 10 -10 10])
xlabel('X'), ylabel('Y'), zlabel('Z')
axis square
grid on

view(135,20)

% Definition of vertices
P2 = [
        5  -1   0       %point 1
        5   1   0       %point 2
        3   1   0       %point 3
        3  -1   0       %point 4
        4   0   2       %point 5
                    ];
% Homogeneous version for transformations
hpoints2=[P2';ones(1,size(P2,1))];

%simple color index to paint the faces
fColor2= [ 6 7 8 9 10 ]';

h2=patch('Vertices', P2, 'Faces', Faces1, ...
    'FaceVertexCData', fColor2, 'FaceColor', 'flat');

% Animation
NN=100;
T(:,:,:,1) = mtrans(linspace(0,4,NN),0,0);
order=0;
Tcurr=eye(4,4);

for n=1:size(T,4)
    Tcurr = manimate(h,hpoints,Tcurr, T(:,:,:,n), order(n));
    pause(1)
end

%% Exercício 9
clearvars
close all
clc

addpath("RI-23-24\lib\")

[P, F] = seixos3();
figure;
subplot(3,2,1)
patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'g')

axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
xlabel('X'), ylabel('Y'), zlabel('Z')
title ('Initial position')
axis square
grid on
hold on
view(110,20)

phi = 45 * pi / 180;
theta = -30 * pi / 180;
psi = 60 * pi / 180;

angles1 = [0, 0, psi];
angles2 = [0, theta, psi];
angles3 = [phi, theta, psi];

T1 = eul2tform(angles1);
T2 = eul2tform(angles2);
T3 = eul2tform(angles3);

P1 = T1*P;
subplot(3,2,2)
patch('Vertices', P1(1:3,:)', 'Faces', F, 'FaceColor', 'y')
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
xlabel('X'), ylabel('Y'), zlabel('Z')
title ('1st step')
axis square
grid on
view(110,20)

P2 = T2*P;
subplot(3,2,3)
patch('Vertices', P2(1:3,:)', 'Faces', F, 'FaceColor', 'y')
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
xlabel('X'), ylabel('Y'), zlabel('Z')
title ('2nd step')
axis square
grid on
view(110,20)

P3 = T3*P;
subplot(3,2,4)
patch('Vertices', P3(1:3,:)', 'Faces', F, 'FaceColor', 'y')
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
xlabel('X'), ylabel('Y'), zlabel('Z')
title ('3rd step')
axis square
grid on
view(110,20)

rots = [phi 0       0       0
        0   theta   0       0 
        0   0       psi     0
        0   0       0       1];

T=eul2tform(rots(1,1:3))*eul2tform(rots(2,1:3))*eul2tform(rots(3,1:3));


P4 = T*P;
subplot(3,2,5);
patch('Vertices', P4(1:3,:)', 'Faces', F, 'FaceColor', 'y')
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
xlabel('X'), ylabel('Y'), zlabel('Z')
title ('All at the same time')
axis square
grid on
view(110,20)

EUL = tform2eul(T);

order = {'first', 'second', 'third'};
was_displayed = false;
count = 0;

for i = 1:size(EUL,2)

    if was_displayed == false
        disp(['Checking if transformations are the' ...
            ' same by comparing'])
        disp(['each value of EUL matrixes' ...
            ' and the angles of rotation'])
        was_displayed = true;
    end

    if abs(EUL(i)-angles3(i)) < 1e4
        str = 'The ' + string(order{i}) + ' value is the same';
        disp(str)
        count = count + 1;
    else
        disp('Something is wrong')
        disp('The matrixes are not the same')
    end

    if count == 3
        disp('The matrixes are the same')
    end
end
