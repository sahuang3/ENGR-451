classdef sequence
	properties
		data
		offset
	end
	
	methods
		function s = sequence(dat, off)
			% SEQUENCE   Sequence object
			%            S = SEQUENCE(DATA, OFFSET) creates sequence S
			%            using DATA and OFFSET
			s.data = dat;
			s.offset = off;
		end
		
		function y = flip(x)
			% FLIP Flip a Matlab sequence structure x so y = x[-n]
			dat = x.data;
			off = x.offset;
			len = length(dat)-1;
			
			% Flipping array and changing the offset
			flipoff = (off + len) * -1;
			fliparr = x.data(end:-1:1);
			y = sequence(fliparr, flipoff);
		end
		
		function y = shift(x, n0)
			% SHIFT Shift a Matlab sequence structure x by integer amount n0 so that y[n] = x[n - n0]
			dat  = x.data;
			off = x.offset;
			
			y = sequence(dat, off+n0);
		end
		
		function z = plus(x, y)
			% PLUS  Add x and y. Either x and y will both be sequence structures, or one of them may be a number.
			if (isa(x, 'sequence') && isa(y, 'double')) % only x is a sequence
				% do something;
				zdat = x.data + y;
				z = sequence(zdat, x.offset);
			elseif  (isa(y, 'sequence') && isa(x, 'double')) % only y is a sequence
				% do something else
				zdat = y.data + x;
				z = sequence(zdat, y.offset);
			else % both x and y are sequences
				% do something
				xdat = x.data;
				ydat = y.data;
				xoff = x.offset;
				yoff = y.offset;
				xlen = length(xdat);
				ylen = length(ydat);

				% Get the array of whole size, min and max of arr
				temparr1 = [1:xlen] + xoff;
				minarr1 = min(temparr1);
				maxarr1 = max(temparr1);
				temparr2 = [1:ylen] + yoff;
				minarr2 = min(temparr2);
				maxarr2 = max(temparr2);
				fullsize = min(min(temparr1), min(temparr2)) : max(max(temparr1), max(temparr2));
				
				% Convert into new array with the new size
				newx = zeros(1,length(fullsize));
				newy = zeros(1,length(fullsize));
				
				% Finding indeces and replacing the values
				newx((fullsize >= minarr1) & (fullsize <= maxarr1)) = xdat;
				newy((fullsize >= minarr2) & (fullsize <= maxarr2)) = ydat;
				
				zdat = newx + newy;
				zoff = min([xoff yoff]);
				z = sequence(zdat, zoff);
			end
		end
		
		function z = minus(x, y)
			% MINUS Subtract x and y. Either x and y will both be sequence structures, or one of them may be a number.
			if(isa(x, 'sequence') && isa(y, 'double'))
				zdat = x.data - y;
				z = sequence(zdat, x.offset);
			elseif (isa(y, 'sequence') && isa(x, 'double'))
				zdat = x - y.data;
				z = sequence(zdat, y.offset);
			else 
				xdat = x.data;
				ydat = y.data;
				xoff = x.offset;
				yoff = y.offset;
				xlen = length(xdat);
				ylen = length(ydat);

				% Get the array of whole size, min and max of arr
				temparr1 = [1:xlen] + xoff;
				minarr1 = min(temparr1);
				maxarr1 = max(temparr1);
				temparr2 = [1:ylen] + yoff;
				minarr2 = min(temparr2);
				maxarr2 = max(temparr2);
				fullsize = min(min(temparr1), min(temparr2)) : max(max(temparr1), max(temparr2));
				
				% Convert into new array with the new size
				newx = zeros(1,length(fullsize));
				newy = zeros(1,length(fullsize));
				
				% Finding indeces and replacing the values
				newx((fullsize >= minarr1) & (fullsize <= maxarr1)) = xdat;
				newy((fullsize >= minarr2) & (fullsize <= maxarr2)) = ydat;
				zdat = newx - newy;
				
				zoff = min([xoff yoff]);
				z = sequence(zdat, zoff);
			end
		end
		
		function z = times(x, y)
			% TIMES Multiply x and y (i.e. .*) Either x and y will both be sequence structures, or one of them may be a number.
			if(isa(x, 'sequence') && isa(y, 'double'))
				zdat = x.data .* y;
				z = sequence(zdat, x.offset);
			elseif (isa(y, 'sequence') && isa(x, 'double'))
				zdat = y.data .* x;
				z = sequence(zdat, y.offset);
			else 
				xdat = x.data;
				ydat = y.data;
				xoff = x.offset;
				yoff = y.offset;
				xlen = length(xdat);
				ylen = length(ydat);

				% Get the array of whole size, min and max of arr
				temparr1 = [1:xlen] + xoff;
				minarr1 = min(temparr1);
				maxarr1 = max(temparr1);
				temparr2 = [1:ylen] + yoff;
				minarr2 = min(temparr2);
				maxarr2 = max(temparr2);
				fullsize = min(min(temparr1), min(temparr2)) : max(max(temparr1), max(temparr2));
				
				% Convert into new array with the new size
				newx = zeros(1,length(fullsize));
				newy = zeros(1,length(fullsize));
				
				% Finding indeces and replacing the values
				newx((fullsize >= minarr1) & (fullsize <= maxarr1)) = xdat;
				newy((fullsize >= minarr2) & (fullsize <= maxarr2)) = ydat;
				
				zdat = newx .* newy;
				zoff = min([xoff yoff]);
				z = sequence(zdat, zoff);
			end
		end
		
		function stem(x)
			% STEM Display a Matlab sequence x using a stem plot.
			dat = x.data;
			off = x.offset;
		
			len = length(dat);
			offArr = [0:len-1]+off;
			
			stem(offArr, dat);
		end
	end
end
