function y = dtft(x, w)

n = [x.offset: x.offset + length(x.data)-1]; 
Q = n'*w; 
y = x.data*exp(-1i*Q);

end