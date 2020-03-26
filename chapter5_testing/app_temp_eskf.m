clear;
% parameters;
Sigma_an = 0.8;
Sigma_sn = 10;
app.gps_hz = 10;
app.Sigma_sn = Sigma_sn;
app.Sigma_an = Sigma_an;


[data_GT, data_measure] = generate_data(Sigma_an,Sigma_sn);
app.data_GT = data_GT;
app.data_measure = data_measure;
eskf_result = run_eskf(app);
visualize_eskf(eskf_result, data_GT, data_measure);


ekf_result = run_ekf(app);
%visualize_ekf(ekf_result, data_GT, data_measure);

%compare_result(ekf_result, eskf_result, data_GT, data_measure )