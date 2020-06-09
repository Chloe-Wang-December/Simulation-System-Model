function [data] = linear45(N,settleTime)
% function [data] = generateTimeSeries(N,settleTime,nonLinear)

% nonLinear = false;    %set to true for nonlinear model ������ģ������Ϊtrue
% N=10000;             %number of points of simulated time seriesģ��ʱ�����е������
% settleTime=1000;    %settling time ����ʱ��
%create a null distribution with randomized phases. this is not always
%necessary, since there is already the test on the coefficients, but it's good to have
%ʹ������׶δ���һ���շֲ��� �Ⲣ�����Ǳ�Ҫ�ģ���Ϊ�Ѿ���ϵ�������˲��ԣ��������ܺ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = N + settleTime;
X = randn(4,N);  %��̬�ֲ�������� 5*N�ľ���
r = sqrt(2);
    %%%%%% linear influences only  ������Ӱ��
for i=6:N
    X(1,i) = X(1,i) + 0.8.*X(1,i-1)+0.65.*X(2,i-4);
    X(2,i) = X(2,i) + 0.6.*X(2,i-1)+0.6.*X(4,i-5);
    X(3,i) = X(3,i) + 0.5.*X(3,i-3)-0.6.*X(1,i-1)+0.4.*X(2,i-4);
    X(4,i) = X(4,i) + 1.2.*X(4,i-1) - 0.7.*X(4,i-2);
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = X(:,settleTime+1:end);
data=X';            %data matrix must have the dimensions [n_points n_variables]

return;