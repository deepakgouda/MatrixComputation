function [iter, lambda] = Powermethod(A, q, k)
    iter = zeros(size(A,1),k);
    iter(:,1) = q;
    for i=1:k-1
        q = A*q;
        [~,indx] = max(abs(q));
        lambda = q(indx);
        q = q/lambda;
        iter(:,i+1) = q;
    end
    iter = normc(iter);
end