function R1=mysqrt1(A)
    [X, D] = eig(A);
    R1 = X*(D.^0.5)*inv(X);
end