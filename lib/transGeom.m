function T = transGeom(x, y, theta)

    T = [   cos(theta)     -sin(theta)  x
            sin(theta)     cos(theta)   y   
            0              0            1   ];
end