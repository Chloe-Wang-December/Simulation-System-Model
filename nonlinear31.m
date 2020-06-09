function [data] = nonlinear31(N,settleTime)
% function [data] = generateTimeSeries(N,settleTime,nonLinear)

% nonLinear = false;    %set to true for nonlinear model ������ģ������Ϊtrue
% N=10000;             %number of points of simulated time seriesģ��ʱ�����е������
% settleTime=1000;    %settling time ����ʱ��
%create a null distribution with randomized phases. this is not always
%necessary, since there is already the test on the coefficients, but it's good to have
%ʹ������׶δ���һ���շֲ��� �Ⲣ�����Ǳ�Ҫ�ģ���Ϊ�Ѿ���ϵ�������˲��ԣ��������ܺ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = N + settleTime;
X = randn(3,N);  %��̬�ֲ�������� 5*N�ľ���
r = sqrt(2);  
    %%%%%% nonlinear case, so you can see that it works better with p=2 �������������������Կ�������p = 2ʱЧ������
for i=2:N
   X(1,i) = 0.4.*X(1,i) + 3.4.*X(1,i-1).*(1-X(1,i-1)^2).*exp(-(X(1,i-1)^2));
   X(2,i) = 0.4.*X(2,i) + 3.4.*X(2,i-1).*(1-X(2,i-1)^2).*exp(-(X(2,i-1)^2))+0.5.*X(1,i-1).*X(2,i-1);
   X(3,i) = 0.4.*X(3,i) + 3.4.*X(3,i-1).*(1-X(3,i-1)^2).*exp(-(X(3,i-1)^2))+0.3.*X(2,i-1)+0.5.*(X(1,i-1)^2);
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = X(:,settleTime+1:end);
data=X';            %data matrix must have the dimensions [n_points n_variables]

return;