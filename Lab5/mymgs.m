function [V, R] = mymgs(V)
    m = size(V,2);
    R = zeros(m);
    for k=1:m
        for i=1:k-1
            R(i,k) = V(:,i)'*V(:,k);
            V(:,k) = V(:,k)-V(:,i)*R(i,k);
        end
        R(k,k) = norm(V(:,k));
        if(R(k,k) == 0)
            error('Rank deficient matrix. Exiting...');
        end
        V(:,k) = V(:,k)/R(k,k);
    end
end
