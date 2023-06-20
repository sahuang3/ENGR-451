function y = odd(x)

xflip = flip(x); % x[n] = x[-n]

% xo[n] = 1/2 *(x[n] - x[-n])
xo = (1/2).*(minus(x,xflip));
y = xo; 

end