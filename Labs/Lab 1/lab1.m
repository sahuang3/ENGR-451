% ENGR 451 - Signals and Systems Laboratory

clear
x = sequence([1 2 3 4 5], 1);
y = sequence([5 4 3 2 1], -1);

% test plus
test_lab1('plus(x, y)')
test_lab1('plus(y, x)')
test_lab1('plus(1, x)')
test_lab1('plus(x, 1)')

y = sequence([4 3 -1 0 3 2 -2 1], 0);
test_lab1('plus(x, y)')
test_lab1('plus(y, x)')

% test minus
test_lab1('minus(x, y)')
test_lab1('minus(y, x)')
test_lab1('minus(1, x)')
test_lab1('minus(x, 1)')

% test time
test_lab1('times(x, y)')
test_lab1('times(2, x)')
test_lab1('times(x, -2)')

% test flip
test_lab1('flip(x)')

% test shift
test_lab1('shift(y, 2)')

%combinations
test_lab1('flip(minus(shift(plus(x, 2), 4), y))')
test_lab1('plus(flip(plus(x, y)), shift(y, -1))')
test_lab1('minus(plus(times(shift(flip(x), 3), shift(y, 2)), flip(y)), x)')

% test stem
set(clf, 'Position', [200 200 400 200])
stem(flip(1+(x-shift(y, 2).*y-3)))
title('y[n]');

% Program Listings
fprintf('\n\n')
disp('--- sequence.m --------------------------------')
type sequence