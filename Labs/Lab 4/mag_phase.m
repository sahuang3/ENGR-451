function y = mag_phase(x)
mag = sqrt(((x.real).*(x.real))+((x.imag).*(x.imag)));
P = zeros(1,length(x.real));

    for n=1:length(x.real)
        P(1,n) = atan2(x.imag(n), x.real(n));
        y.mag = mag;
        y.phase = P;
    end
end