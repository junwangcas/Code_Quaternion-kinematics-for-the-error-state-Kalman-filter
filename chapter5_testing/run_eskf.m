function [eskf_result] = run_eskf(app)
data_GT = app.data_GT;
data_measure = app.data_measure;
gps_hz = app.gps_hz;
Sigma_sn = app.Sigma_sn;

x = [data_GT.s(1);data_GT.v(1)];
deltax = [0; 0];
P = [0.01, 0; 0, 0.01];
xs = x;
deltaxs = deltax;
Ps = {length(data_GT.t)};
Ps{1} = P;
ts = data_GT.t(1);
correction_xs = [];
DeltaT = data_GT.t(2) - data_GT.t(1);
for i = 2:length(data_GT.t)
    % prediction;
    x(1) = x(1) + x(2)*DeltaT + 0.5*data_measure.a(i)*DeltaT*DeltaT;
    x(2) = x(2) + data_measure.a(i)*DeltaT;
    
    deltax(1) = deltax(1) + deltax(2)*DeltaT;
    deltax(2) = deltax(2);
    
    F = [1, DeltaT;0,1];
    P = F*P*F';
    
    % update 
    if mod(i, 100/gps_hz) == 0
        V = Sigma_sn;
        H = [1, 0];
        K = P*H'*inv(H*P*H' + V);
        y = data_measure.s(i);
        deltax = K*(y - (x(1) + deltax(1)));
        P = (eye(2) - K*H) * P;
        
        % insert
        x = x + deltax;
        
        % save;
        correction_xs = cat(2, correction_xs, deltax);
        % reset;
        deltax = [0,0]';
    end
    xs = cat(2, xs, x);
    deltaxs = cat(2, deltaxs, deltax);
    Ps{i} = P;
    ts = cat(1, ts, data_GT.t(i));
end
eskf_result.xs = xs;
eskf_result.correction_xs = correction_xs;
eskf_result.deltaxs = deltaxs;
eskf_result.ts = ts;
end

function visualize_eskf(app)

end

