%% Returns Wilkinson Matrix
function WilkMat = getWilkinson(n)
    WilkMat = tril(ones(n)*-1, -1)+eye(n);
    WilkMat(:, n)=1;
end
