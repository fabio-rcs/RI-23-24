function Org = LinkOrigins(AA)
%LINKORIGINS esta função devolve uma matriz com as origens dos diversos
%sistemas de coordenadas de um manipulador, dada a hipermatriz de 
%transformações obtida com Tlinks()
% Aceita uma hipermatriz AA de matrizes de transformação geométrica (uma
% para cada elo) e devolve as coordenadas das diversas origens, começando
% em [0 0 0]'
    T = eye(4);
    
    Org(:,1) = [0 0 0]';
    % Org(1,:) = [0 0 0]'; % For 2D matrixes

    for i=1:size(AA,3)
        T = T*AA(:, :, i);
        Org(:,i+1) = T(1:3, end);
    end
end