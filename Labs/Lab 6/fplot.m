function fplot(b,a)

	a = populate(a);
    b = populate(b);

    N = 512;                   % number of points to graph
    n = linspace(0,1,N/2);     % this is the x axis for the plot
    Hz = fft(b, N) ./ fft(a,N);

   
    % this part plots the magnitude subplot
    subplot(2,1,1);
    plot(n, abs(Hz(1:N/2)));
    xlim([0 1]);
    ylim([0 max(abs(Hz(1:N/2)))]);
    ylabel('|H(\omega)|');
    set(gca, 'XTick', []);

    % this part plots the phase subplot
    subplot(2,1,2);
    x = round(Hz(1:N/2), 5);
    phase = round(angle(x)/pi,4); % this rounding fixes the phase jumping issue
    plot(n, phase);
    hold on;
    plot([0 1], [0 0], 'black')
    hold off;
    xlim([0 1]);
    ylim([-1,1]);
    ylabel('< H(\omega) (fractions of \pi)');
    xlabel('\omega (fractions of \pi)');

end