function [d_hat, w] = MyNLMS(d, u, n, mu_tilla)
%   MYNLMS Implements the Normalized Least Mean Squares (NLMS) algorithm.
%   [d_hat, w] = MyNLMS(d, u, n, mu_tilla) returns the estimated output signal
%   d_hat and the filter coefficients w obtained by applying the NLMS algorithm
%   to the input signals d and u.
%
%   Inputs:
%       d - The desired signal samples.
%       u - The input signal samples.
%       n - The number of filter taps.
%       mu_tilla - The stepsize parameter.
%
%   Outputs:
%       d_hat - The estimated output signal.
%       w - The filter coefficients.

% Check if mu_tilla is non-positive, set it to a default value
if mu_tilla <= 0
    mu_tilla = 0.1;
end

% Zero-padding the input signal
u = [zeros(1, n-1), u];

% Initialize variables
d_hat = zeros(1, size(u, 2) - n + 1);
error = zeros(1, size(u, 2) - n + 1);
w = zeros(1, n);  % Coefficients

% Main NLMS algorithm loop
for i = 1:size(d_hat, 2)
    % Compute predicted output
    d_hat(i) = u(i:i+n-1) * transpose(w);
    
    % Compute error
    error(i) = d(i) - d_hat(i);
    
    % Compute step size parameter (normalized by input power)
    mu = mu_tilla / (0.1 + sum(u(i:i+n-1) .* u(i:i+n-1)));
    
    % Update filter coefficients
    w = w + mu * error(i) * u(i:i+n-1);
end

end
