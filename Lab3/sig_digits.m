%%
%{
The Rule-of-thumb of ill-conditioning says that if cond(A) = 10 t , and the entries of A and
b are correct to s decimal places, then one should expect an agreement of at least s − t
significant digits in the corresponding entries of the exact solution and computed solution
of Ax = b obtained from GEPP or from Cholesky decomposition (which is applied if A is
positive definite).
Given a Hilbert matrix H, the aim of the code is to verify the above rule of thumb for
solutions of the system Hx = b obtained via a number of different solution methods.
%}

N = 8:2:12;
format long e;
for n = N
    H = hilb(n);
    HI = invhilb(n);
    x = rand(n, 1);
    b = H*x;
    x1 = HI*b;
    x2 = geppsolve(H, b);

    R = mychol(H);
    y = solveLower(R', b);
    x3 = solveUpper(R, y);
%     fprintf('n = %d : %.16f %.16f %.16f\n', n, norm(x-x1)/norm(x), norm(x-x2)/norm(x), norm(x-x3)/norm(x));
    fprintf('n = %d\n', n);
    disp([norm(x-x1)/norm(x) norm(x-x2)/norm(x) norm(x-x3)/norm(x)]);
    disp(cond(H));
end





