function A = AnimateSimple2D(h, P, M, N)
    
    MM = [];

    for c= 2:size(M, 1)
        MM = [ linspace(M(c-1, 1), M(c, 1), N)
               linspace(M(c-1, 2), M(c, 2), N)
               linspace(M(c-1, 3), M(c, 3), N)];
        
        for n = 1:size(MM, 2)
            t = transGeom(MM(1, n), MM(2, n), MM(3, n));
            An = t*P;
            h.Vertices = An';
            h.FaceColor=[round(rand(1)) round(rand(1)) round(rand(1))];
            pause(0.05);
        
        end
    end
end
