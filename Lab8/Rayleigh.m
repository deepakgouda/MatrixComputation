function [iter, lambda] = Rayleigh(A, q, k)
%     [Q, H] = hess(A);
    H = A;
    iter = zeros(size(H,1),k);
    iter(:,1) = q;
    for i=1:k-1
        s = (q'*H*q)/(q'*q);
        [L,U,P] = lu(H-s*eye(size(H)));
        q = P*q;
        q = L\q;
        q = U\q;
        [~,indx] = max(abs(q));
        lambda = q(indx);
        q = q/lambda;
        iter(:,i+1) = q; % Q*q
    end
    lambda = 1/lambda + s;
end