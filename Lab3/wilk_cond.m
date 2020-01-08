%% Check the relation between relative error and ill-conditioning in Wilkinson Matrix
N = 32:8:80;
for n = N
    W = getWilkinson(n);
    x = rand(n, 1);
    b = W*x;
    x1 = geppsolve(W, b);
    disp([n norm(x - x1)/norm(x1) cond(W, inf)])
end
