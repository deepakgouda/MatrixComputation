%{
Computes the R of a QR decomposition of A ∈ R n×n via reflectors
%}
function R = reflectqr(A)
    for i=1:size(A,2)-1
        % Obtain tau, gamma, and u such that Q = (I — gamma*uu')
        % is a reflector for which Qx = [—tau 0 • • • 0]'
        [u, gamma, tau] = reflect(A(i:end, i));
        A(i:end, i) = u;
        
%         Perform the computation QA efficiently using the reflectors
        A(i:end,i+1:end) = applreflect(u, gamma, A(i:end,i+1:end));
        A(i,i) = -tau;
    end
    R = A;
end