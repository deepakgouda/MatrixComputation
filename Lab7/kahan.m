%% 4.2.21
theta = 1.2;
n = 90;
s = sin(theta);
c = cos(theta);

C = triu(ones(n,n)*(-c), 1) + eye(n);
S = diag(diag(flip(vander(ones(n, 1)*s), 2)));

%% 4.2.21 (a)
R = S*C;
disp([max(diag(R)) min(diag(R))]);
sig = svd(R);
disp([sig(1) sig(n-1) sig(n)]);

%% 4.2.21 (b)
A = gallery('kahan', n, theta, 0);
sig = svd(A);
disp([sig(1) sig(n-1) sig(n)]);

%% 4.2.21 (c)
A = gallery('kahan', n, theta, 25);
sig = svd(A);
disp([sig(1) sig(n-1) sig(n)]);

[Q, R, E] = qr(A);
dif = norm(eye(n)-E);
disp([R(n, n)]);