% convolv.m - convolution of two signals

function y = convolv(x, w)
    x = [zeros(1, size(w, 2) - 1), x];
    y = zeros(1, size(x, 2) - size(w, 2) + 1);
    
    for i = 1:size(y, 2)
        segment = x(i:i + size(w, 2) - 1);
        y(i) = segment * w.';
    end
end


