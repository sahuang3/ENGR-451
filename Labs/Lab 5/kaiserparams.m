function [N, beta] = kaiserparams(deltaOmega, delta)

% From the equation: A = -20*log10(beta)
A = -20*log10(delta);

% From the equation: N = (A-8)/(2.285*deltaOmega)
deltaOmega = deltaOmega*pi;
N = ceil((A-8)/(2.285*deltaOmega));

% If A > 50, beta = 0.1102*(A-8.7)
if A>50
	beta = 0.1102*(A-8.7);
end

% If 21 <= A <= 50, beta = 0.5842*(A-21)^0.4 + 0.07886*(A-21)
if A >= 21 && A <= 50
	beta = 0.5842*((A-21)^0.4) + 0.07886*(A-21);
end

% If A < 21, beta = 0
if A<21
	beta = 0;
end

end