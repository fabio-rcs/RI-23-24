function R = mrotz(v)
% R - Matrix of homogeneous transformation
% v - vetor rotação
    N = length(v);
    R = zeros(4,4,N);

    for i = 1:N
        R(:,:,i) = rotz(v(i));
    end
end