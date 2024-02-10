% This code observes the effect of the step-size parameter in convergence
% in the mean.

clc;

n = 4;                     % Number of coefficients
mu = 0.3;                  % Step-size parameter
u = randn(1, 100);         % Input signal
d = convolv(u, [0.81, 1.8, 1]);  % Desired signal obtained by convolution

% Uncomment the line below to observe non-convergence with a step-size of 0.4
% [d_hat, w] = Mylms(d, u, n, 0.4); 

% Execute LMS algorithm with specified parameters
[d_hat, w] = Mylms(d, u, n, mu);
