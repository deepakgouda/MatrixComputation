%%
%{
shows why small pivots should be avoided and also demonstrates the better
numerical properties of Gaussian Elimination with Partial Pivoting over no pivoting in dealing
with matrices with small entries in pivotal positions
%}
N = 20:20:100;
for n=N
    A = rand(n);
    A(1, 1) = 50*eps*A(1,1);
    [L, U] = genp(A);
    disp([n norm(L) norm(U) norm(L*U-A)]);
    
    [L, U, P] = lu(A);
    disp([n norm(L) norm(U) norm(L*U-P*A)]);
    disp('');
end