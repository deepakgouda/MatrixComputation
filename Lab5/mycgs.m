function [V, R] = mycgs(V)
    m = size(V,2);
    R = zeros(m);
    for k=1:m
        R(1:k-1,k) = V(:,1:k-1)'*V(:,k);
        V(:,k) = V(:,k)-V(:,1:k-1)*R(1:k-1,k);
        R(k,k) = norm(V(:,k));
        if(R(k,k) == 0)
            error('Rank deficient matrix. Exiting...');
        end
        V(:,k) = V(:,k)/R(k,k);
    end
end