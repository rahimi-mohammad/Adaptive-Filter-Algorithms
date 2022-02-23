% in this code we  observe the effect of step-size parameter in 
% convergence in the mean
clc
n=4;                    % number of coefficients
mu=0.3;
u=randn(1,100);
d=convolv(u,[0.81 1.8 1]);
% [d_hat w]=Mylms(d,u,n,0.4) % it doesn't converge
[d_hat, w]=Mylms(d,u,n,mu); 

