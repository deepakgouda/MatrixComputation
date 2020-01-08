rng(0);

genp_time = [];
inv_time = [];
for n=200:50:1150
    A = rand(n);
    b = rand(n, 1);
    tic
    x = A\b;
    time = toc;
    genp_time = [genp_time time];
    
    tic
    x = inv(A)*b;
    time = toc;
    inv_time = [inv_time toc];
end

hold on
semilogy(genp_time)
semilogy(inv_time)
legend('GENP', 'INV')
xlabel('Size')
ylabel('Time')
hold off