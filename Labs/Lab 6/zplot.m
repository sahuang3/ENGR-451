function zplot(b,a)
	a = populate(a);
	b = populate(b);

	% this gets the roots of the numerator which are the zeros
	zeros = roots(b);
	zerosX = real(zeros);
	zerosY = imag(zeros);

    % this gets the roots of the denomonator, the poles
    poles = roots(a);
    polesX = real(poles);
    polesY = imag(poles);

    % this part plots the unit circle, and the axis
    theta = linspace(0,2,501) * pi;
    x = cos(theta);
    y = sin(theta);
    graph = plot(y,x, 'b');
    axis equal;
    hold on;
    graph = plot([-2 2],[0 0], 'black');
    graph = plot([0 0], [-2 2], 'black');
    
    % these two if statements will plot the poles and zeros on the plot
    for i = 1:length(zeros)
        graph = plot(zerosX(i),zerosY(i), 'bo');
    end

    for i = 1:length(poles)
        graph = plot(polesX(i),polesY(i), 'rx');
    end
    hold off;
    xlim([-2 2]);
    ylim([-2 2]);

end