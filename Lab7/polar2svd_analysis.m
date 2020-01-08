normU1 = zeros(1, 15);
normV1 = zeros(1, 15);
normU2 = zeros(1, 15);
normV2 = zeros(1, 15);

for j=1:15
    A = rand(20);
    I = eye(20);
    [U, ~, V] = polar2svd(A);
    normU1(1,j) = norm(U'*U-I);
    normV1(1,j) = norm(V'*V-I);
    [U, ~, V] = svd(A);
    normU2(1,j) = norm(U'*U-I);
    normV2(1,j) = norm(V'*V-I);
end

figure;
hold on;
plot(normU1, 'r');
plot(normU2, 'b');
legend('polar2svd', 'svd');
title('U');
hold off;

% figure;
% hold on;
% plot(normV1, 'r');
% plot(normV2, 'b');
% legend('polar2svd', 'svd');
% title('V');
% hold off;