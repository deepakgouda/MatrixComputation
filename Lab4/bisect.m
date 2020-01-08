%%
%{
MATLAB program x = bisect[p, x0 , x1 , tol] which finds a root of a polynomial
p(x) in an interval [x0 , x1 ] upto a given tolerance tol using the Bisection
method (see Note 2 below). You should use the function Horner to evaluate the poly-
nomial p(x) at a point x.

Note 2 (Bisection method:) The traditional bisection method is a tool to find
a root of a polynomial p(x) in an interval which makes repeated use of the fact
that given a continuous function f on an interval [a, b], such that f (a) and f (b) are
of opposite sign, there exists at least one c ∈ (a, b) such that f (c) = 0.
Choosing an initial interval say [x0 , x1 ] satisfying p(x0)p(x1) < 0, the first
step is to evaluate p(x) at the midpoint x mid = (x0 +x1 )/2 (hence the name ’bisection’)
and check the signs of p(x0), p(xmid) and p(x1). If p(x0) and p(xmid) are of opposite
sign, then the procedure is repeated for the interval [x0, xmid]. Otherwise it is
repeated for [xmid, x1]. The method is necessarily iterative (i.e. it does not terminate
after a finite number of steps). In practice, it is terminated upon finding a
number that lies in an interval [xr−tol, xr+tol] where xr is an exact root of p(x)
in the initial interval [x0, x1] and tol is a tolerance value provided by the user.(This
is achieved by writing a while statement which is executed as long as the length
of the interval to be bisected at any given step is greater than 2 tol.)
%}
function x = bisect(p, x0, x1, tol)
    t = 10;
    while(t > 0)
        t = t-1;
        p0 = Horner(p, x0);
        p1 = Horner(p, x1);

%         if(p0 == 0)
%             x = x0;
%             break;
%         elseif(p1 == 0)
%             x = x1;
%             break;
%         end
        
        xmid = (x0+x1)/2;
        pmid = Horner(p, xmid);
        
        if(abs(pmid) <= tol)
            x = xmid;
            break;
        end
        
        if(p0*pmid < 0)
            x1 = xmid;
        else
            x0 = xmid;
        end
        
        disp([x0 x1 pmid]);
    end
end