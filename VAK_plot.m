function VAK_plot(x, y, xtext, ytext, A, B, X, Y, apos);
figure('Position', get(0,'ScreenSize'))

set(0,'DefaultAxesColorOrder',[0 0 0],...
      'DefaultAxesLineStyleOrder','-|--|-.|:')

x = A*x+B;
plot( x, y, 'linewidth', 2 ),
axis([0 X 0 Y]), grid on,
xlabel(xtext, ...
    'FontName', 'Arial cyr', ...
    'FontSize', 14, ...
    'HorizontalAlignment', 'right'...
    ),
ylabel(ytext, ...
    'FontName', 'Arial cyr', ...
    'FontSize', 14, ...
    'HorizontalAlignment', 'right', ...
    'VerticalAlignment', 'cap', ...
    'Rotation', 0 ...
  ),
pos = get(gca, 'position')
xlim = get(gca, 'XLim');
ylim = get(gca, 'YLim');
xpos = get(get(gca,'XLabel'), 'Position');
ypos = get(get(gca,'YLabel'), 'Position');

xpos(1) = xlim(2);
ypos(2) = ylim(2);
set(get(gca,'XLabel'), 'Position', xpos);
set(get(gca,'YLabel'), 'Position', ypos);

N = size(y,2);
if(N>1)
    v = y(apos, :);
    m = max(v);
    for n = 1:N
        xx = x(apos)/xlim(2)*pos(3) + pos(1);;
        yy = y(apos,n)/ylim(2)*pos(4) + pos(2);
        znak = 2*(v(n)==m)-1;
        annotation('textarrow',xx+[-.1 0], yy+[znak*.1 0], 'String', n);
    end
end

set(gcf, 'renderer', 'opengl');
