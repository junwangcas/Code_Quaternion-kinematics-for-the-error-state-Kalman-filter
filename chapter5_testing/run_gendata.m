clear;
[data_GT, data_measure] = generate_data(0.01,0.1);


% postion 
figure;
plot(data_GT.s);
hold on; plot(data_measure.s);
legend('gt','measure');
title('position');

hold on; plot(data_GT.v);
hold on; plot(data_GT.a);
legend('s','v','a');

