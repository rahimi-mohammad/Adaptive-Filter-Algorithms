clc
close all
n1=2;                    % number of coefficients
n2=3;                    % number of coefficients
K=200;                   % number of trials
mu=0.1;
n_iterations=100;
e1=zeros(K,n_iterations);
e2=zeros(K,n_iterations);

for k=1:K
 u=randn(1,n_iterations);
 d=convolv(u,[0.81 1.8 1]);

 [d_hat1, w1]=myNLMS(d,u,n1,mu);
 [d_hat2, w2]=myNLMS(d,u,n2,1);
 
 e1(k,:)=(d_hat1-d).*(d_hat1-d);
 e2(k,:)=(d_hat2-d).*(d_hat2-d);
end

plot(1:n_iterations,sum(e1)/K , 'r')       
hold on
plot(1:n_iterations,sum(e2)/K , 'b')       
title('The Effect of the Number of Coefficients')
ylabel('MSE')
xlabel('NO. OF ITERATIONS')
legend('2 coefficients','3 coefficients')

