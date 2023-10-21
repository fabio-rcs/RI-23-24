function h = DrawFrames(AA, P, F, Color)
%DRAWLINKS desenha um gráfico que representa outros objetos associados aos
%elos, como os referenciais

    T = eye(4);
    h = eye(size(AA,3)+1);
    h(1) = patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'w');
    
    for n = 1:size(AA,3)
        T = T*AA(:,:,n);
        Pn = T*P;
        h(n+1) = patch('Vertices', Pn(1:3,:)', 'Faces', F, 'FaceColor', Color(n));
    end
end
