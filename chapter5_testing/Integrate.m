function [result_integration] = Integrate(data_GT, data_measure)
x = [data_GT.s(1);data_GT.v(1)];
deltax = [0; 0];
xs = [];
deltaxs = [];

DeltaT = data_GT.t(2) - data_GT.t(1);
for i = 2:length(data_GT.t)
    x(1) = x(1) + x(2)*DeltaT + 0.5*data_measure.a(i)*DeltaT*DeltaT;
    x(2) = x(2) + data_measure.a(i)*DeltaT;
    
    deltax(1) = deltax(1) + deltax(2)*DeltaT;
    deltax(2) = deltax(2);
    
    xs = cat(2, xs, x);
    deltaxs = cat(2, deltaxs, deltax);
end

result_integration.xs = xs;
result_integration.deltaxs = deltaxs;
end

