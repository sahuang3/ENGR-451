function y = resamp(x, r)

% Finding Upsample/Downsample ratio
[U, D] = rat(r);

% Upsampling
len = length(x);
upsample = zeros(1, len*U);
upsample(1:U:end) = x;

% Take the highest ratio of Up/downsampling
w = max(U,D);

% Normalized frequency
fn = 1/w;
N = round(1+20/fn);
h = U*fir1(N-1, fn, kaiser(N,5));

% Convolution
x_filter = conv(upsample, h, 'same');

% Downsampling
y = x_filter(1:D:end);

end