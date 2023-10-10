function A = mtrans(X, Y, Z)

    % M - Matrix of homogeneous transformation
    % x - translation in x
    % y - translation in y
    % z - translation in z
    m = max([numel(X), numel(Y), numel(Z)]);

    X(end:m) = X(end);
    Y(end:m) = Y(end);
    Z(end:m) = Z(end);
    
    A = zeros(4, 4, m);
    
    for n=1:m
        A(:,:,n) = trans(X(n), Y(n), Z(n));
    end
end
