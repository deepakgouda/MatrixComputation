%% Solve Ax=b using Gaussian Elimination by Partial Pivoting
function x = geppsolve(A, b)
    [P, L, U] = gepp(A);
    b = P*b;
    y = solveLower(L, b);
    x = solveUpper(U, y);
end