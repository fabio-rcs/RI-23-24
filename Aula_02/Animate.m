function pFinal=Animate(h,P,pInicial,D,N)
    % Animate(h, P, pInicial, D, N)
    %   h – handle gráfico do objeto a animar (movimentar);
    %   P – matriz de pontos do objeto (no formato homogéneo);
    %   pInicial – Matriz de transformação da posição inicial do objeto;
    %   D – vetor[x, y, z, ϕ, θ, ψ] com os incrementos totais em posição e
    %       orientação vistos do referencial local do objeto; este vetor 
    %       servirá para criar a matriz de transformação que ser´a usada em
    %       pós-multiplicação.
    %   N – número de passos da animação da etapa ("duração" do movimento);
    %   pFinal – matriz com a posição do objeto no final do movimento.


    X=D(1);
    Y=D(2);
    Z=D(3);
    phi=D(4);
    theta=D(5);
    psi=D(6);
    
    tt=linspace(0,1,N);
    
    for t=tt
        
        T=trans(t*X,t*Y,t*Z)*rotx(t*phi)*roty(t*theta)*rotz(t*psi);
        Ttotal=pInicial*T;
    
        P1=pInicial*P;
    
        h.XData=P1(1,:); 
        h.YData=P1(2,:); 
        h.ZData=P1(3,:);
    
        pause(0.01)
    
    end
    
    pFinal=Ttotal;

end

