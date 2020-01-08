%% Computes polar factors of matrix A
function [W, R] = polard2(A)
    R = mysqrt1(A*A');
    W = inv(R)*A;
end
