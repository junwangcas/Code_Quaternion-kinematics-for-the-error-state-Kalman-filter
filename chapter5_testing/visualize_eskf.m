function [ output_args ] = visualize_eskf( eskf_result, data_GT, data_measure )
figure;
plot(eskf_result.ts, eskf_result.xs(1,:));
hold on; plot(eskf_result.ts, data_measure.s);
hold on; plot(eskf_result.ts, data_GT.s)
legend('eskf estimation', 'measurement', 'ground truth');
title('postion');


figure;
plot(eskf_result.ts, eskf_result.xs(2,:));
hold on; plot(eskf_result.ts, data_GT.v);
legend('eskf estimation', 'ground truth');
title('velocity');
end

