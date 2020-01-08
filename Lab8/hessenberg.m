function [Q,H]=hessenberg(A)
    n=max(size(A));
    Q=eye(n);
    H=A;
    for k=1:(n-2)
        [u,gamma,~]=reflect(H(k+1:n,k));
        I=eye(k);
        N=zeros(k,n-k);
        m=length(u);
        Q1=eye(m)-gamma*(u*u');
        H(k+1:n,k:n)=Q1*H(k+1:n,k:n);
        H(1:n,k+1:n)=H(1:n,k+1:n)*Q1;
        P=[I, N; N', Q1];
        Q=Q*P;
    end
end
