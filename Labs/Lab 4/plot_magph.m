function plot_magph(x,w)

z = mag_phase(dtft2(x, w));
plot(w/pi,z.mag,'linewidth',2);
grid on;
ylabel('Magnitude');

plot(w/pi, z.phase/pi,'linewidth',2);
grid on;
ylabel('Phase');
xlabel('w(rad/pi)');

end