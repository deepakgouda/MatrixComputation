function [iter, lambda] = Shiftinv(A, q, s, k)
    iter = zeros(size(A,1),k);
    [L,U,P] = lu(A-s*eye(size(A)));
    iter(:,1) = q;
    for i=1:k-1
        q = P*q;
        q = L\q;
        q = U\q;
        [~,indx] = max(abs(q));
        lambda = q(indx);
        q = q/lambda;
        iter(:,i+1) = q;
    end
    iter = normc(iter);
    lambda = 1/lambda + s;
end