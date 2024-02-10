% Modeling an IIR system using FIR filters and applying LMS and NLMS
% algorithms to estimate the system's output in the presence of noise.

n = [4; 35];             % Number of coefficients
n_iterations = 300;
K = 200;                 % Number of trials
A = [0; 0.1; 0.3; 1];    % Noise variance
mu = 0.03;

% Initialize arrays to store mean square error (MSE)
e1 = zeros(K, n_iterations);
e2 = zeros(K, n_iterations);

% Create tiled layout for plotting
tiledlayout(size(n, 1), size(A, 1))
title('IIR system modeled by FIR filter using coefficients')

for j = 1:size(A, 1)
    for i = 1:size(n, 1)
        for k = 1:K
            % Generate noisy input signal
            u = randn(1, n_iterations);
            d = filter([1, 0.5], [1, -0.9], u) + A(j) * randn(1, n_iterations);

            % Apply LMS algorithm
            [d_hat1, w1] = myLMS(d, u, n(i), mu);

            % Apply NLMS algorithm
            [d_hat2, w2] = myNLMS(d, u, n(i), 1);

            % Compute mean square error (MSE)
            e1(k, :) = (d_hat1 - d) .* (d_hat1 - d);
            e2(k, :) = (d_hat2 - d) .* (d_hat2 - d);
        end
        
        % Plot the MSE for each iteration
        nexttile;
        plot(1:n_iterations, sum(e1) / K, 'r')       
        hold on
        plot(1:n_iterations, sum(e2) / K, 'b')       
        ylabel('MSE')
        xlabel('Number of Iterations')
        legend('LMS', 'NLMS')
        title(['n = ', num2str(n(i)), ' coefficients and A = ', num2str(A(j)), ' noise variance'])
    end
end
