function [ output_args ] = visualize_ekf( ekf_result, data_GT, data_measure )
figure;
plot(ekf_result.ts, ekf_result.xs(1,:));
hold on; plot(ekf_result.ts, data_GT.s);
legend('ground truth', 'ekf estimation');
title('postion ekf');


figure;
plot(ekf_result.ts, ekf_result.xs(2,:));
hold on; plot(ekf_result.ts, data_GT.v);
legend('ground truth', 'ekf estimation');
title('velocity ekf');
end

