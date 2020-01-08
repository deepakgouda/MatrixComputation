%% Computes polar factors of matrix A
function [W, R] = polard1(A)
    [m, n] = size(A);
    [U, S, V] = svd(A);
    if(m >= n)
        U = U(:,1:n);
        S = S(1:n,1:n);
        W = U*V';
        R = V*S*V';
    else
        S = S(1:m,1:m);
        V = V(:,1:m);
        R = U*S*U';
        W = U*V';
    end
end
