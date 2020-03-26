function [ output_args ] = compare_result(ekf_result, eskf_result, data_GT, data_measure )
error_eskf_p = abs(eskf_result.xs(1,:) - data_GT.s');
error_eskf_v = abs(eskf_result.xs(2,:) - data_GT.v');
error_ekf_p = abs(ekf_result.xs(1,:) - data_GT.s');
error_ekf_v = abs(ekf_result.xs(2,:) - data_GT.v');

figure;
plot(eskf_result.ts, error_eskf_p);
hold on; plot(eskf_result.ts, error_ekf_p);
legend('eskf error', 'ekf error');
title('postion estimation error');

figure;
plot(eskf_result.ts, error_eskf_v);
hold on; plot(eskf_result.ts, error_ekf_v);
legend('eskf error', 'ekf error');
title('velocity estimation error');
end

