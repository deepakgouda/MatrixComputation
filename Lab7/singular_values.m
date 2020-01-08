%% 4.2.19
m = randi(100, 1);
n = randi(100, 1);
A = randn(m, n);
disp([m n])
[U, S, V] = svd(A);
k = min(m, n);
disp(S(k,k));