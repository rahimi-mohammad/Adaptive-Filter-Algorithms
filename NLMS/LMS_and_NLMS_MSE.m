clc
close all
n=4;                    % number of coefficients
K=200;                   % number of trials
mu=0.1;
e1=zeros(K,100);
e2=zeros(K,100);

for k=1:K
 u=randn(1,100);
 d=convolv(u,[0.81 1.8 1]);
 
 [d_hat1, w1]=myLMS(d,u,n,mu);
 [d_hat2, w2]=myNLMS(d,u,n,1);
 e1(k,:)=(d_hat1-d).*(d_hat1-d);
 e2(k,:)=(d_hat2-d).*(d_hat2-d);

end

plot(1:100,sum(e1)/K , 'r')       % excess mean square error is zero and for mu=0.3 it takes about 53 iterations to fall to 10% of error peak
hold on
plot(1:100,sum(e2)/K , 'b')       % excess mean square error is zero and it takes about 18 iterations to fall to 10% of error peak
ylabel('MSE')
xlabel('NO. OF ITERATIONS')
legend('LMS','NLMS')
