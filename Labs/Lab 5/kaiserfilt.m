function h = kaiserfilt(N, wc, beta)

% Getting the size and splitting into even indices	
n = (N-1)/2;
M = linspace(-n,n,N);

% Getting unfiltered h[n]
h = (wc * sinc(wc*M));

% Using Matlab's besseli command to get w[n]
w = besseli(0, beta .* sqrt(1-(2.*M/(N-1)).^2)) ./ besseli(0, beta);

% Filtering h[n]*[n]
h = h .* w;
h = h/sum(h);

end