%% Column Oriented Back Substitution
function b=solveUpper(U, b)
    n = size(b, 1);
    b(n) = b(n)/U(n,n);
    for j=(n-1):-1:1
        for k=(j+1):n
            b(j)=b(j)-U(j,k)*b(k);
        end
        b(j) = b(j)/U(j,j);
    end
end