%% Returns Hamilton Matrix
function HamiltonMat = getHamilton(n)
    H11 = randn(floor(n/2));
    H11 = diag(diag(H11)) + tril(H11, -1)+tril(H11, -1)';
    H12 = randn(floor(n/2));
    H12 = diag(diag(H12)) + tril(H12, -1)+tril(H12, -1)';
    
    HamiltonMat = [H11 H12; H12 -H11];
end

