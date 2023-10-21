function MQ = LinspaceVect(Qi, Qf, N)
    %LinspaceVect emulates the linspace operation on the vectors
    % Qi is the inicial values vector
    % Qf is the final values vector
    % N is the number of elements of linspace
    % The output is MQ: the matrix with all the vector
    % Each line is the linpace of the corresponding elements from Qi to Qf

    MQ = zeros(size(Qi, 1), N);

    for j = 1:size(Qi,1)
        MQ(j,:) = linspace(Qi(j), Qf(j), N);
    end
end