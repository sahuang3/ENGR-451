function y = overlap_save(x, h, lc)
% OVERLAP_SAVE Convolve x and h using overlap-save method
% y = overlap_save(x, h, lc)
% x and h are arrays,
% lc is the chunk size (default 50)

lh = length(h);
lx = length(x);

% create array to hold final convolved squence
y = zeros(1, lx+lh-1);
    
% if the chunk length passed to the function is greater than the length
% of x, then reset the chunk length to the length of x. If chunk length
% is greater than 500, reset to 500 (max chunk size)
if lc > lx
    lc = lx;
elseif lc > 500
	lc = 500;
end

% take the first chunk from 1 to lc
x_chunk = x(1:lc);
y_chunk = conv(x_chunk, h);
y(1:lc+lh-1) = y_chunk;

% set the y_offset to lc
y_offset = lc;
% set the x offset to lc - length of h + 1
x_offset = lc-lh+1;

% while there are still full length chunks remaining
while x_offset + lc <= lx
    % take a chunk of x from x_offset + 1 to offset + lc
    x_chunk = x(x_offset+1:x_offset + lc);
	% convolve chunk with h
    y_chunk = conv(x_chunk, h);
	% place y_chunk in the final sequence at the location starting at
    % y_offset+1. This will overwrite the unwanted values from the
    % previous chunk's convolution (y_offset is lc-1 greater than
    % x_offset to account for this)
    y(y_offset+1:y_offset + lc) = y_chunk(lh:end);
	% increment y_offset and x_offset by the chunk length minus the
    % length of h + 1
    y_offset = y_offset + lc - lh + 1;
    x_offset = x_offset + lc - lh + 1;
end

% if there are still remaining values in x, a special chunk the length
% of the remaining elements is created, convolved with h, and placed
% into y
if lx - (x_offset + lc) < 0
    x_chunk = x(x_offset + 1: end);
    y_chunk = conv(x_chunk, h);
    y(y_offset + 1:end) = y_chunk(lh:end);
end

end