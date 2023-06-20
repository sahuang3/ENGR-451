function ph = magdb(h)

% Doing FFT with N points
N = 1024;
H = fft(h, N);

% Getting the magnitude
mag = abs(H);

w = (0:(N/2-1))/(N/2);
mag = mag(1:N/2);

% Converting into db
mag_db = 20*log10(mag);

ph = plot(w,mag_db);
set(ph, 'LineWidth', 3, 'Color', 'r');

end