rng(0);
Wilkinson(5)
Hamilton(4)
function WilkMat = Wilkinson(n)
    WilkMat = tril(ones(n)*-1, -1)+eye(n);
    WilkMat(:, n)=1;
end

function HamiltonMat = Hamilton(n)
    H11 = randn(floor(n/2));
    H11 = diag(diag(H11)) + tril(H11, -1)+tril(H11, -1)';
    H12 = randn(floor(n/2));
    H12 = diag(diag(H12)) + tril(H12, -1)+tril(H12, -1)';
    
    HamiltonMat = [H11 H12; H12 -H11];
end

