%% Get Cholesky Factor
function R = mychol(A)
    n = size(A, 1);
    sqrt_a11 = sqrt(A(1,1));
    if n == 1
        R = sqrt_a11;
    else
        if A(1,1) < 0
            error('Matrix is not positive definite. Exiting...')
            exit
        end
        R = zeros(size(A));
        b = A(2:n,1);
        R(1,1) = sqrt_a11;
        R(1,2:n) = (b/sqrt_a11)';
        R(2:n,2:n) = mychol(A(2:n,2:n) - b*b'/A(1,1));
    end
end