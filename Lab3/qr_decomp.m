%%
%{
Solve W x = b using QR decomposition and compare the results with GEPP
where W is Wilkinson's matrix.
%}

N = 32:8:80;
for n = N
    W = getWilkinson(n);
    x = rand(n, 1);
    b = W*x;
    x1 = geppsolve(W, b);
    disp([n norm(x - x1)/norm(x1) cond(W, inf)])
    
    [Q, R] = qr(W);
    y = Q'*b;
    x2 = solveUpper(R, y);
    disp([n norm(x - x2)/norm(x2) cond(W, inf)])
end
