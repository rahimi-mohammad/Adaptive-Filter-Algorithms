function y = convolv(x, w)
% CONVOLV Convolution of two signals.
%   y = CONVOLV(x, w) computes the convolution of input signal x and impulse
%   response w.

% Prepend zeros to the input signal x to handle boundary conditions
x = [zeros(1, size(w, 2) - 1), x];

% Initialize the output signal y
y = zeros(1, size(x, 2) - size(w, 2) + 1);

% Perform convolution
for i = 1:size(y, 2)
    % Extract the segment of x for convolution
    segment = x(i:i + size(w, 2) - 1);
    
    % Transpose the filter coefficients
    transposed_w = transpose(w);
    
    % Compute the convolution for the current segment
    y(i) = segment * transposed_w;
end

end
