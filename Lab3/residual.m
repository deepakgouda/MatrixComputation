%%
%{
If x̂  is the computed solution of Ax = b then r := Ax̂ − b is called the residual. Of course
r = 0 if and only if x = x̂. But usually r 6 = 0. Does a small ||r|| imply ||x − x̂k|| small?
%}
N = 10:2:16;
for n = N
    H = hilb(n);
    x = randn(n,1);
    b = H*x;
    x1 = geppsolve(H, b);
    r = H*x1-b;
    disp([n norm(r) norm(x-x1)]);
end