k = 10;
A = [1 1 1; -1 9 2; 0 -1 2];
[V, ~] = eig(A);
x = V(:,2)+V(:,3);
check_convergence(A, x, k);

A = [1 1 1; -1 9 2; -4 -1 2];
[V, ~] = eig(A);
x = V(:,2)+V(:,3);
check_convergence(A, x, k);

A = [1 1 1; -1 3 2; -4 -1 2];
[V, ~] = eig(A);
x = V(:,2)+V(:,3);
check_convergence(A, x, k);

function check_convergence(A, x, k)
    [V, D] = eig(A);
    v = V(:,1);
    th_conv = abs(D(2, 2))/abs(D(1, 1));
    
    [iter, ~] = Powermethod(A, x, k);
    act_conv = norm(iter(:,end)-v)/norm(iter(:,end-1)-v);
    disp([norm(act_conv-th_conv)]);
end