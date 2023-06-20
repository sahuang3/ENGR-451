function y = conv_rt(x, h)
 lh = length(h);
 hbuf = h(:)'; % make h a row vector
 x = [x(:); zeros(lh-1, 1)]; % pad x with zeros
 y = zeros(1, length(x)); % preallocate output array
 xbuf = zeros(lh, 1); % initialize input array as column vector
for i = 1:length(x) % for each new value of x[n]
	 % put x(i) into the correct place in xbuf
	 xbuf = [x(i); xbuf]; 
	 xbuf(end) = [];
	 % set up the indexing into the hbuf and/or xbuf arrays here
	 y(i) = hbuf * xbuf; % store output value

 end
end