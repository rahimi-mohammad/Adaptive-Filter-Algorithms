n = 4;         % Number of coefficients
K = 200;       % Number of trials
mu = 0.1;      % Step size parameter

% Initialize arrays to store mean square error (MSE)
e1 = zeros(K, 100);
e2 = zeros(K, 100);

% Perform multiple trials
for k = 1:K
    % Generate input signal
    u = randn(1, 100);
    
    % Convolve input signal with filter coefficients
    d = convolv(u, [0.81, 1.8, 1]);
    
    % Apply LMS algorithm
    [d_hat1, w1] = myLMS(d, u, n, mu);
    
    % Apply NLMS algorithm
    [d_hat2, w2] = myNLMS(d, u, n, 1);
    
    % Compute mean square error (MSE)
    e1(k, :) = (d_hat1 - d) .* (d_hat1 - d);
    e2(k, :) = (d_hat2 - d) .* (d_hat2 - d);
end

% Plot the MSE for each iteration
plot(1:100, sum(e1) / K, 'r')  % Plot LMS MSE
hold on
plot(1:100, sum(e2) / K, 'b')  % Plot NLMS MSE
ylabel('MSE')
xlabel('Number of Iterations')
legend('LMS', 'NLMS')
