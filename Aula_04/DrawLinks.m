function h = DrawLinks(Org)
%DRAWLINKS desenha um gráfico que representa os elos do robô

    for i=1:size(Org, 2)
        if i < size(Org,2)
            X = [Org(1,i), Org(1,i+1)];
            Y = [Org(2,i), Org(2,i+1)];
            Z = [Org(3,i), Org(3,i+1)];
            h = plot3(X, Y, Z, 'Color','b');
            h.LineWidth = 2;
            hold on
            scatter3(X(1), Y(1), Z(1), 'filled', ...
                'MarkerFaceColor', 'r')
        else
            scatter3(Org(1,i), Org(2,i), Org(3,i), 'filled', ...
                'MarkerFaceColor', 'r')
        end

    end

    hold off
end

