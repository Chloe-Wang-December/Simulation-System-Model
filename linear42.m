function [data] = linear42(N,settleTime)
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
for i=3:N
    X(1,i) = X(1,i) + 2.*0.95.*cos(0.628)*X(1,i-1)-0.95.*0.95.*X(1,i-2);
    X(2,i) = X(2,i) + 0.5.*X(1,i-1)+0.5.*X(4,i-1);
    X(3,i) = X(3,i) + 2.*0.8.*cos(1.256).*X(3,i-1)-0.8.*0.8.*X(3,i-2)-0.5.*X(1,i-2);
    X(4,i) = X(4,i) + 2.*0.9.*cos(1.884).*X(4,i-1) - 0.9.*0.9.*X(4,i-2)+X(1,i-2);
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = X(:,settleTime+1:end);
data=X';            %data matrix must have the dimensions [n_points n_variables]

return;