[data_GT, data_measure] = generate_data();

Sigma_sn = 0.1;

x = [data_GT.s(1);data_GT.v(1)];
deltax = [0; 0];
P = [0.01, 0; 0, 0.01];
xs = x;
deltaxs = deltax;
Ps = {length(data_GT.t)};
Ps{1} = P;


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
    if mod(i, 10) == 0
        V = Sigma_sn;
        H = [1, 0];
        K = P*H'*inv(H*P*H' + V);
        y = data_GT.s(i);
        deltax = K*(y - (x(1) + deltax(1)));
        P = (eye(2) - K*H) * P;
        
        % insert
        x = x + deltax;
        
        %P = [0.01, 0; 0, 0.01];
    end
    xs = cat(2, xs, x);
    deltaxs = cat(2, deltaxs, deltax);
    Ps{i} = P;
end

plot(xs(1,:));
hold on;plot(xs(2,:));