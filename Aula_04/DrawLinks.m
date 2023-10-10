function h = DrawLinks(Org)
%DRAWLINKS desenha um gráfico que representa os elos do robô

    for i=1:size(Org, 2)
        if i < size(Org,2)
            X = [Org(1,i), Org(1,i+1)];
            Y = [Org(2,i), Org(2,i+1)];
            Z = [Org(3,i), Org(3,i+1)];
            h = line(X, Y, Z);
            h.LineWidth = 2;
            hold on
            plot3(X(1), Y(1), Z(1), 'or', 'MarkerSize', 15)
        else
            plot3(Org(1,i), Org(2,i), Org(3,i), 'or', 'MarkerSize', 15)
        end

    end

    hold off
end

