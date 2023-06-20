function y = trim(x)

% find index of first/last indices of nonzero values
firstidx = find(x.data, 1, 'first');
lastidx = find(x.data, 1, 'last');
temp = x.data(firstidx:lastidx);


% offset change
total = length(x.data) - length(find(x.data));
y.offset = x.offset + total;

y.data = temp;
end