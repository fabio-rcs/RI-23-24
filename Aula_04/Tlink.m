function [A] = Tlink(theta, l, d, alpha)
%TLINK transfomação associada a um elo. Devolve a matriz respetiva
%e aceita os 4 parâmetros de D-H

    A = rotz(theta)*trans(l, 0, d)*rotx(alpha);
end

