% myLMS.m - Least Mean Squares (LMS) algorithm
%
% Inputs:
% d  - Vector of desired signal samples of size (1 x N_d).
% u  - Vector of input signal samples of size (1 x N_u).
% n  - Number of taps.
% mu - Step size parameter.
%
% Outputs:
% w     - Filter coefficients (1 x n).
% d_hat - Filter output (estimation of the output) (1 x (N_u - n + 1)).

function [d_hat, w] = myLMS(d, u, n, mu)
    u = [zeros(1, n - 1), u];
    d_hat = zeros(1, size(u, 2) - n + 1);
    error = zeros(1, size(u, 2) - n + 1);
    w = zeros(1, n);  % Initialize filter coefficients

    for i = 1:size(d_hat, 2)
        d_hat(i) = u(i:i + n - 1) * w.';
        error(i) = d(i) - d_hat(i);
        w = w + mu * error(i) * u(i:i + n - 1);
    end
end
