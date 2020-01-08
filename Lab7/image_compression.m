clear;
load clown.mat;

[U, S, V] = svd(X);
e = zeros(1, 10);
i = 1;
for k = 10:10:100 % 520*k/64000
    figure
    colormap('gray');
    Y = U(:, 1:k)*S(1:k, 1:k)*V(:,1:k)';
    image(Y);
    e(i) = S(k+1,k+1)/S(1,1);
    i = i+1;
end

