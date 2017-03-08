% 贷款人会出借本金 P 作为初始欠款
% 每个季度他们需要定期还款 R
% 季度利率为 I
% 第 i 个季度结束后的欠款 Bi 为
% 上期欠款
% 加上根据上期欠款计入的利息
% 再减去还款

% variables
var float: R; % quarterly repayment
var float: P; % principal initially borrowed
var 0.0 .. 2.0: I; % interest rate
% intermediate variables
var float: B0;
var float: B1; % balance after one quarter
var float: B2; % balance after two quarters
var float: B3; % balance after three quarters
var float: B4; % balance at end
constraint B0 = P;
constraint B1 = P * (1.0 + I) - R;
constraint B2 = B1 * (1.0 + I) - R;
constraint B3 = B2 * (1.0 + I) - R;
constraint B4 = B3 * (1.0 + I) - R;
solve satisfy;
