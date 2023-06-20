function h = rectfilt(N, wc)

% Splitting N into rectangle
n = -((N-1)/2) : ((N-1)/2);

% Getting unfiltered h[n] (rectangle = pulse w/length N)
h = [ones(1,N)];

% From the equation: h_ideal[n] = wc/pi * sinc(wc*n)
w = wc*sinc(wc*n);

% Filtering h[n]*w[n] 
h = h .* w;
h = h/sum(h);

end