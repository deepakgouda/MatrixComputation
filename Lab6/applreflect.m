%{
Efficiently performs the multiplication QA where Q = I − γuu'
%}
function B = applreflect(u, gamma, A)
    B = A - gamma*u*(u'*A);
end