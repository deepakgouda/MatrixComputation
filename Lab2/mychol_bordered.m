%% Get Cholesy Factor
function R = mychol_bordered(A)
    n = size(A, 1);
    if n == 1
        R = sqrt(A(n,n));
    else
        R_j = mychol_bordered(A(1:n-1,1:n-1));
        h = solveLower(R_j', A(1:n-1,n));
        coeff = sqrt(A(n,n) - h'*h);
        if coeff < 0
            error('Matrix is not positive definite. Exiting...')
        end
        R = zeros(size(A));
        R(n,n) = coeff;
        R(1:n-1,n) = h;
        R(1:n-1,1:n-1) = R_j;
    end
end