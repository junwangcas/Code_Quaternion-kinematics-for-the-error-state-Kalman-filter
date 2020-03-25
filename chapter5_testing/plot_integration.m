function [] = plot_integration(app, data_GT, result_integration)
% position
cla(app.UIAxes3);
plot(app.UIAxes3, data_GT.s);
hold(app.UIAxes3, 'on');
plot(app.UIAxes3, result_integration.xs(1,:));
xlabel(app.UIAxes3, 'time');
ylabel(app.UIAxes3, 'x');
legend(app.UIAxes3, 'gt','prediction');
title(app.UIAxes3, 'position');

% velocity;
% position
cla(app.UIAxes4);
plot(app.UIAxes4, data_GT.v);
hold(app.UIAxes4, 'on');
plot(app.UIAxes4, result_integration.xs(2,:));
xlabel(app.UIAxes4, 'time');
ylabel(app.UIAxes4, 'm/s');
legend(app.UIAxes4, 'gt','prediction');
title(app.UIAxes4, 'velocity');
end

