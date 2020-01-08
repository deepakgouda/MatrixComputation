x = ones(3, 1);
k = 10;
s = 5;
A = [1 1 1; -1 9 2; 0 -1 2];
check_shift(A, x, s, k);
A = [1 1 1; -1 9 2; -4 -1 2];
check_shift(A, x, s, k);
A = [1 1 1; -1 3 2; -4 -1 2];
check_shift(A, x, s, k);

function check_shift(A, x, s, k)
    [iter, lambda] = Shiftinv(A, x, s, k);
    [V, D]=eig(A);
    [~,indx]=max(abs(diag(D)));
    norm(iter(:,end)-V(:,indx))
    norm(lambda - D(indx, indx))
end
