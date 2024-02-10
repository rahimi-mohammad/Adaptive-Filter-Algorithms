% Compare the effect of the number of coefficients on NLMS algorithm

clc
close all

% Parameters
n1 = 2;               % Number of coefficients for the first case
n2 = 3;               % Number of coefficients for the second case
K = 200;              % Number of trials
mu = 0.1;             % Step size
n_iterations = 100;   % Number of iterations per trial

% Initialize arrays to store mean square errors (MSEs)
e1 = zeros(K, n_iterations);
e2 = zeros(K, n_iterations);

% Perform trials
for k = 1:K
    % Generate random input signal
    u = randn(1, n_iterations);
    
    % Generate desired signal corrupted by noise
    d = convolv(u, [0.81 1.8 1]);
    
    % Apply NLMS algorithm with n1 coefficients
    [d_hat1, ~] = myNLMS(d, u, n1, mu);
    
    % Apply NLMS algorithm with n2 coefficients
    [d_hat2, ~] = myNLMS(d, u, n2, 1);
    
    % Calculate MSE for each trial
    e1(k, :) = (d_hat1 - d) .^ 2;
    e2(k, :) = (d_hat2 - d) .^ 2;
end

% Plot the results
plot(1:n_iterations, sum(e1) / K, 'r')       
hold on
plot(1:n_iterations, sum(e2) / K, 'b')       
title('The Effect of the Number of Coefficients')
ylabel('MSE')
xlabel('Number of Iterations')
legend('2 coefficients', '3 coefficients')
