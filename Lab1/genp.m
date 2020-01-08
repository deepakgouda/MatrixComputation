%% Gaussian Elimination with No Pivoting
function [L, U] = genp(A)
    n = size(A, 1);
    for k=1:n-1
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end

    U = triu(A);
    L = tril(A,-1)+eye(n);
end