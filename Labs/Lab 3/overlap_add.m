function y = overlap_add(x, h, lc)
% OVERLAP_ADD  Convolve x and h using overlap-add method
%              y = overlap_add(x, h, lc)
%              x and h are arrays,
%              lc is the chunk size (default 50)

% Set default chunk size if not specified
if nargin < 3
    lc = 50;
end

% Get length of x and h
lx = length(x);
lh = length(h);

% Calculate the length of the FFT required for convolution
L = lc + lh - 1;
N = 2^nextpow2(L);

% Initialize the output array with zeros
y = zeros(1, lx+lh-1);

% Start processing each chunk of the input sequence
for i = 1:ceil(lx/lc)
% Get current chunk of x
    n1 = (i-1)*lc + 1;
    n2 = min(i*lc, lx);
    chunk_x = x(n1:n2);

% Pad chunk_x with zeros if necessary
    pad_length = N - length(chunk_x);
    chunk_x = [chunk_x, zeros(1, pad_length)];

% Compute the convolution of the chunk and the filter in the frequency domain
    Y = ifft(fft(chunk_x) .* fft(h, N));

% Add the output of this chunk to the final output using overlap-add method
    n3 = (i-1)*lc + 1;
    n4 = min(i*lc+lh-1, lx+lh-1);
    y(n3:n4) = y(n3:n4) + Y(1:n4-n3+1);
end

end