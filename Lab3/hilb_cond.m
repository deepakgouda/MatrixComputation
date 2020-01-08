%% Change in condition number of Hilbert matrices
C1=[];
C2=[];
Cinf=[];
N= 2:2:16;

for n=N
    H=hilb(n); 

    C1=[C1; cond(H,1)];
    C2=[C2; cond(H)];
    Cinf=[Cinf; cond(H,inf)];

end

figure;
semilogy(N,C1)
title('With 1-norm');
figure;
semilogy(N,C2)
title('With 2-norm');
figure;
semilogy(N,Cinf)
title('With infinity-norm');