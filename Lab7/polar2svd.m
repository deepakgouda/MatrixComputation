function [U, S, V] = polar2svd(A)
    [W, R] = polard2(A);
    [V, S] = eig(R);
    [S, I] = sort(diag(S),'descend');
    S = diag(S);
    V = V(:,I);
    U = W*V;
end