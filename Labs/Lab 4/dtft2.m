function y = dtft2(x,w)
n = (x.offset:x.offset + length(x.data)-1);
Q = n'*w;
dtft = x.data*exp(-1i*Q);

    for n=1:length(dtft)
        mag = abs(dtft(n)); 
        ang = angle(dtft(n));
        y.real(n) = mag*cos(ang);
        y.imag(n) = mag*sin(ang);
    end
end