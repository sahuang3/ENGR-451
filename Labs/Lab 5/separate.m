function [sr,sc] = separate(s,fs)

% If the '*' key works then all keys should too
% '*'= 1209(column) + 941(row) Hz
fc = (1209 + 941)/2;
wc = 2*fc/fs;

% Getting params for kaiser filter
deltaOmega = (2*1209/fs) - (2*941/fs);
[N, beta] = kaiserparams(deltaOmega, 0.001);

% Creating lowpass filter and convolving with sound file
lpf = kaiserfilt(N, wc, beta);
sr = conv(s, lpf);

% Creating highpass filter and convolving with sound file
% Kaiser filters should be odd, so need to round up by adding 1 to n (n+1)
hpf = -lpf;
n = (N-1)/2;
hpf(n+1) = 1 + hpf(n+1);
sc = conv(s,hpf);

end