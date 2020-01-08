%% Gaussian Elimination with Partial Pivoting
function [P, L, U, parity] = gepp(A)
    n = size(A,1);
    p = (1:n)'; % needed to make the corresponding Permutation matrix
    parity = 1;
    for k=1:n-1
        [~, m] = max(abs(A(k:n,k))); % find max leading value row index
        m = m + k-1; % max index of the submatrix + shift
        if(m ~= k)
            parity = parity*-1;
            A([k,m],:) = A([m,k],:); % swap m and k rows
            p([k,m]) = p([m,k]);
        end
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    U = triu(A);
    L = tril(A,-1)+eye(n);
    I = eye(n);
    P = I(p, :); % create the identity matrix and swap the rows
end