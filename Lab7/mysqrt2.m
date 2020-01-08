%% Works for positive definite matrices
function R2=mysqrt2(A)
    G = mychol(A);
    [~, S, V] = svd(G);
    R2 = V*S*V';
end