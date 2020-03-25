function [outputArg1,outputArg2] = plot_generate_data(app, data_GT, data_measure)
% postion 
cla(app.UIAxes);
plot(app.UIAxes, data_GT.s);
hold(app.UIAxes, 'on');
plot(app.UIAxes, data_measure.s);
xlabel(app.UIAxes, 'time');
ylabel(app.UIAxes, 'x');
legend(app.UIAxes, 'gt','measure');
title(app.UIAxes, 'position');

% accerate;
cla(app.UIAxes2);
plot(app.UIAxes2, data_GT.a);
hold(app.UIAxes2, 'on');
plot(app.UIAxes2, data_measure.a);
xlabel(app.UIAxes2, 'time');
ylabel(app.UIAxes2, 'm/s^2');
legend(app.UIAxes2, 'gt','measure');
title(app.UIAxes2, 'acceration');
end

