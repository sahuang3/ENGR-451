function h = hammingfilt(N, wc)

% Getting the size and indices
n = (N-1)/2;
M = -n:n;

% Getting the unfiltered h[n]
h = wc/pi * sinc(wc*M);

% From the equation: w[n]= (0.54+0.46cos(2pi*n/(N-1))
w = 0.54+0.46 .* cos(2.*pi.*M/(N-1));

% Filtering h[n]*w[n]
h = h .* w;
h = h/sum(h);

end