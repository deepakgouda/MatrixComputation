%%
%{
MATLAB function program y = Horner(p, x) which uses Horner’s rule (see Note
1 below) to evaluate a polynomial p(z) = p1(z)^n + p2(z)^n−1 + · · · + pn(z) + pn+1 at z = x by
taking x ∈ R and a vector p with p(i) = pi , i = 1 : n + 1 as input. Design your program
in such a way that if the user passes x as a vector (say in R m ), then the output is a
vector y ∈ R m satisfying y(i) = p(x(i)), i = 1 : m.

Note 1 (Horner’s method) Given p(z) = Σ nk=0 p n−k+1 z k , the Horner’s method uses the
fact that
p1*x^n + p2*x^n−1 + · · · + pn*x + pn+1 = pn+1 + x*(pn + · · · + x(p3 + x*(p2 + p1*x)))
to evaluate p(z) at z = x.
%}
function y = Horner(p, x)
    y = zeros(size(x));
    for i=1:length(x)
        y(i) = Horner_helper(p, x(i));
    end
end

function y = Horner_helper(p, x)
    if size(p, 2) == 1
        y = p(1);
    elseif size(p, 2) == 2
        y = p(1)*x + p(2);
    else
        y = p(end) + x*Horner_helper(p(1:end-1), x);
    end
end