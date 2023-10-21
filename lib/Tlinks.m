function [AA] = Tlinks(DH)
%TLINKS aceita uma matriz de Denavit-Hartenberg (DH) e devolve
%uma matriz de transformação para cada elo (linha de DH) dispostas ao
%longo da 3a dimensão da hipermatriz AA

    % Start by alocating memory for AA
    AA = zeros(4, 4, size(DH,1));
    
    % For each line in DH, call the function Tlink to transform
    for i=1:size(DH,1)
        AA(:,:,i) = Tlink(DH(i,1), DH(i,2), DH(i,3), DH(i,4));
    end
end