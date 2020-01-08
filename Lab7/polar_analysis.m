norm1 = zeros(1, 15);
norm2 = zeros(1, 15);

I = eye(20);

for j=1:15
    A = rand(20);
    sig = sort(diag(A), 'descend');
    sig = sig/sig(end)*(10^(-j+6));
    sig = diag(sig);
    M1 = rand(20);
    [Q1,~] = qr(M1);
    M2 = rand(20);
    [Q2,~] = qr(M2);
    A = Q1*sig*Q2';
    [W, R] = polard1(A);
    [T, X] = polard2(A);
    norm1(1,j) = norm(W'*W-I);
    norm2(1,j) = norm(X'*X-I);
end

figure;
hold on;
plot(norm1, 'r');
plot(norm2, 'b');
legend('polard1', 'polard2');
hold off;