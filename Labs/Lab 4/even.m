function y = even(x)

xflip = flip(x); % x[n] = x[-n]

% xe[n] = 1/2 *(x[n] + x[-n])
xe = (1/2).*(plus(x,xflip));
y = xe; 

end