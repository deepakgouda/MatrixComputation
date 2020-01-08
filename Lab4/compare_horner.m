%%
%{
Evaluate the polynomial p at 151 equidistant points
(use linspace command) in the interval [1.93, 2.08] using the program y = Horner(p, x).
Then evaluate p for the same points by directly using the formula p(x) = (x − 2)^9 .
%}

x = linspace(1.93, 2.08, 151);
p = [1 -18 144 -672 2016 -4032 5376 -4608 2304 -512];
z1 = (x-2).^9;
z2 = Horner(p, x);

hold on
plot(x, z1, 'red')
plot(x, z2, 'blue')
hold off