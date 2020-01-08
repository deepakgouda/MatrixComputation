format long e;
warning off;
t = [-5:0.5:6]';
b = sin(pi/5*t)+t/5;
A = ones(23, 20);
for i=2:20
    A(:, i) = t.^i;
end

p1 = A\b;
c1 = cond(A);

A2 = A'*A;
b2 = A'*b;
R = mychol(A2);
y = solveLower(R', b2);
p2 = solveUpper(R, y);
c2 = cond(A2);

A3 = [eye(23) A;A' zeros(20, 20)];
b3 = [b; zeros(20, 1)];
p3 = A3\b3;
p3 = p3(24:end);
c3 = cond(A3);

r1 = norm(b - A*p1);
r2 = norm(b - A*p2);
r3 = norm(b - A*p3);

disp([r1 r2 r3]);
disp([c1 c2 c3]);
