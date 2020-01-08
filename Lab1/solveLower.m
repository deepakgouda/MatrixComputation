%% Column Oriented Forward Substitution
function b=solveLower(L, b)
    n = size(b, 1);
    for j=1:(n-1)
        b(j)=b(j)/L(j,j);
        for k=(j+1):n
            b(k)=b(k)-L(k,j)*b(j);
        end
    end
    b(n) = b(n)/L(n,n);
end