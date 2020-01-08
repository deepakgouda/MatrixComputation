x = ones(3, 1);
k = 10;
A = [1 1 1; -1 9 2; 0 -1 2];
check_convergence(A, x, k);
A = [1 1 1; -1 9 2; -4 -1 2];
check_convergence(A, x, k);
A = [1 1 1; -1 3 2; -4 -1 2];
check_convergence(A, x, k);

function check_convergence(A, x, k)
    [V, D] = eig(A);
    [~,indx] = max(abs(diag(D)));
    sorted_val = sort(abs(diag(D)));
    v = V(:,indx);
    th_conv = sorted_val(end-1)/sorted_val(end);
    
    [iter, ~] = Powermethod(A, x, k);
    act_conv = norm(iter(:,end)-v)/norm(iter(:,end-1)-v);
    disp([norm(act_conv-th_conv)]);
%     disp([act_conv th_conv]);
end