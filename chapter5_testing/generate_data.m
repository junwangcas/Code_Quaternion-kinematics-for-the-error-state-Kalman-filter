function [data_GT, data_measure] = generate_data(Sigma_an, Sigma_sn)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data_GT.a 加速度的真值
% data_GT.s 位置的真值；
% data_GT.v 速度的真值
% data_GT.t 时间；
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data_measure.a 加速度测量值
% data_measure.s 位置的测量值；
% data_measure.t 时间
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters;
% param.t0 起始时间
% param.tn 终止时间
% param.tk 中间间隔时间；
% param.Sigma_an 加速度协方差
% param.Sigma_sn 位置协方差
% param.m 系数1
% param.n 系数2
param.t0 = 0;
param.tn = 10;
param.tk = 0.01;
param.Sigma_an = Sigma_an;
param.Sigma_sn = Sigma_sn;
param.m = 1;
param.n = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data_GT.a = [];
data_GT.s = [];
data_GT.v = [];
data_GT.t = [];
data_measure.a = [];
data_measure.s = [];
data_measure.t = [];

m = param.m;
n = param.n;
for t = param.t0:param.tk:param.tn
    sgt = sin(m*t) + cos(n*t);
    vgt = m*cos(m*t) - n*sin(n*t);
    agt = -m*m*sin(m*t) - n*n*cos(n*t);
    
    sn = randn(1,1)*sqrt(param.Sigma_sn);
    an = randn(1,1)*sqrt(param.Sigma_an);
    
    data_GT.s = cat(1, data_GT.s, sgt);
    data_GT.a = cat(1, data_GT.a, agt);
    data_GT.v = cat(1, data_GT.v, vgt);
    data_GT.t = cat(1, data_GT.t ,t);
    
    data_measure.s = cat(1, data_measure.s, sgt + sn);
    data_measure.a = cat(1, data_measure.a, agt + an);
    data_measure.t = cat(1, data_measure.t, t);
end
end

