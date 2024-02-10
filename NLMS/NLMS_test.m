
% Define parameters
n = 4;                  % Number of coefficients
mu_tilla = 1;           % Step-size parameter
u = randn(1, 100);      % Input signal
d = convolv(u, [0.81 1.8 1]);  % Desired signal convolved with a filter kernel

% Call the function to estimate the output
[d_hat, w] = myNLMS(d, u, n, mu_tilla);
