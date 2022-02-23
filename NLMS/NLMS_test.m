clc
n=4;                    % number of coefficients
mu_tilla=1;
u=randn(1,100);
d=convolv(u,[0.81 1.8 1]);
% [d_hat w]=myNLMS(d,u,n,2) % it doesn't converge
[d_hat, w]=myNLMS(d,u,n,mu_tilla); 


