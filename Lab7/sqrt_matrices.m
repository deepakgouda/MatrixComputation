N = [5:12];
r1 = zeros(1, length(N));
r2 = zeros(1, length(N));
r3 = zeros(1, length(N));

for n=5:12
    A = hilb(n);
    R1 = mysqrt1(A);
    R2 = mysqrt2(A);
    R3 = sqrtm(A);
    r1(n-4) = norm(A-R1*R1)/norm(A);
    r2(n-4) = norm(A-R2*R2)/norm(A);
    r3(n-4) = norm(A-R3*R3)/norm(A);
end

hold on
plot(N, r1, 'red')
plot(N, r2, 'blue')
plot(N, r3, 'green')
legend('mysqrt1', 'mysqrt2', 'sqrtm')
hold off