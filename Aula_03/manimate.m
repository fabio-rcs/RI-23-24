function Tlast=manimate(h,P,Tcurr,Tset,ord)

    %   h – handle gráfico do objeto a animar (movimentar);
    %   P – matriz de pontos do objeto (no formato homogéneo);
    %   Tcurr – Matriz de transformação da posição inicial do objeto;
    %   Tset - hiprmatriz de transformações geométricas com o conjunto
    %         dos passos intermédios para a animação
    %   ord - indicador se as transformações presentes na hipermatriz
    %       são para serem feitas no referencial local(ord=1) ou
    %       global(ord=0)
    %   Tlast – última posição onde foi deixado o objeto no fim da animação

    for n=1:size(Tset,3)
        if ord == 1
             T = Tcurr * Tset(:,:,n);
        else
            T = Tset(:,:,n)*Tcurr;
        end

        Pn = T*P;

        h.Vertices = Pn(1:3,:)';
        pause(0.01)
    end

    Tlast = T;
end


