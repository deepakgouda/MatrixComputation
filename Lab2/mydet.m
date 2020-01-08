%% Get determinant of a matrix
function det = mydet(A)
    n = size(A, 1);
    [~, ~, U, parity] = gepp(A);
    det = 1;
    for i=1:n
        det = det*U(i,i);
    end
    det = det*parity;
end