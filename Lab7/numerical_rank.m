%% 4.2.20
format short e;
A = randn(8,4) ;
A (:,5:6) = A (:,1:2) + A(:,3:4) ;
[Q, R] = qr(randn(6)) ;
A = A*Q;
[U, S, V] = svd(A);

% default tolerance value
% tol = max(size(A)) * eps(norm(A));
tol = eps/100;
disp([sum(sum(S>tol)) rank(A)]);
