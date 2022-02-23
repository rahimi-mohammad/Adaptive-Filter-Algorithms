%  Using LMS and NLMS algorithms, we model an IIR model when the desired
%  signal is corupted by noise
clc
close all
n=[4;35];                    % number of coefficients
n_iterations=300;
K=200;                   % number of trials
A=[0;0.1;0.3;1];                   % noise variance
mu=0.03;
e1=zeros(K,n_iterations);
e2=zeros(K,n_iterations);
%%
tiledlayout(size(n,1),size(A,1))
title('IIR system modeled by FIR filter using  coefficients')

for j=1:size(A,1)
    for i=1:size(n,1)
        for k=1:K
         u=randn(1,n_iterations);
         d=filter([1 0.5],[1 -0.9],u) + A(j)*randn(1,n_iterations);        % corrupted refrense signal
         [d_hat1, w1]=myLMS(d,u,n(i),mu);
         [d_hat2, w2]=myNLMS(d,u,n(i),1);
         e1(k,:)=(d_hat1-d).*(d_hat1-d);
         e2(k,:)=(d_hat2-d).*(d_hat2-d);

        end
        nexttile;
        plot(1:n_iterations,sum(e1)/K , 'r')       
        hold on
        plot(1:n_iterations,sum(e2)/K , 'b')       
        ylabel('MSE')
        xlabel('NO. OF ITERATIONS')
        legend('LMS','NLMS')
        title(['n=',num2str(n(i)),' coefficients and A=',num2str(A(j)),'noise variance'])

    end
end