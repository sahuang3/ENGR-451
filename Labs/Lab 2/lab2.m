% lab2.m
% Please place lab2.m in your working directory 
% Provide the print-out from running this function
% using 'publish lab2'
%
% T. Holton 10 Sept 21

clear
test_lab2;

%% Real-time Convolution
% Real-time convolution #1
x = [1 4 2 6 5];
h = [4 -1 3 -5 2];
test_lab2;
test_lab2(x, h);

% Real-time convolution convolution #2
test_lab2(h, x);

% Real-time convolution #3
x = cos(2 * pi * (1:50000) / 16); % nice, big sequence
h = ones(1, 10);
test_lab2(x, h);

%% Code
disp('---------------------------------------------------')
disp('                     Code')
disp('---------------------------------------------------')
type convolv_rt
