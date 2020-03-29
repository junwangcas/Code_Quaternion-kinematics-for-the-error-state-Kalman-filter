function [ekf_result] = run_ekf(app)
data_GT = app.data_GT;
data_measure = app.data_measure;
gps_hz = app.gps_hz;
Sigma_sn = app.Sigma_sn;
Sigma_an = app.Sigma_an;

x = [data_GT.s(1);data_GT.v(1)];
P = [0.01, 0; 0, 0.01];
xs = x;
Ps = {length(data_GT.t)};
Ps{1} = P;
ts = data_GT.t(1);
DeltaT = data_GT.t(2) - data_GT.t(1);
for i = 2:length(data_GT.t)
    % prediction;
    x(1) = x(1) + x(2)*DeltaT + 0.5*data_measure.a(i)*DeltaT*DeltaT;
    x(2) = x(2) + data_measure.a(i)*DeltaT;
    
    F = [1, DeltaT;0,1];
    G = [0.5*DeltaT*DeltaT;DeltaT];
    Q = Sigma_an;
    P = F*P*F' + G*Q*G';
    
    % update 
    if mod(i, 100/gps_hz) == 0
        V = Sigma_sn;
        H = [1, 0];
        y = data_measure.s(i) - x(1);
        K = P*H'*inv(H*P*H' + V);
        x = x + K*y;
        P = (eye(2) - K*H) * P;
    end
    xs = cat(2, xs, x);
    Ps{i} = P;
    ts = cat(1, ts, data_GT.t(i));
end
ekf_result.xs = xs;
ekf_result.ts = ts;
end

