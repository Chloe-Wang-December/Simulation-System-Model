function xM = lattice(m,c,n,x0M)
% INPUTS
% - m   : the number of coupled maps (time series)
% - c   : the coupling strength
% - n   : the time series length
% - x0M : initial conditions, a matrix of size 2 x m
% OUTPUTS
% - xM  : the n x m matrix of the generated time series
f=@(x)(1-2*abs(0.5-x));%������ű��ʽ
if nargin<=3              %判断输入变量的个�?
    x0M = NaN;
end
if length(c)==1                     %c的长度为1时，生成�?个m*1的列向量
    cV = c*ones(m,1);
else
    cV = c;
end
if isnan(x0M)               %  x0M是NAN时，进行如下计算
    ntrans = 10000;
    %x0limV = [-1 1]'; % -1,0.01��һ�����Բο���ֵ�����ֵҲ�ܳ��� 
    xM = NaN*ones(n+ntrans,m);
    %tmpM = rand(1,m);  %  随机产生2*m矩阵，产生（0,1）随机数
    %xM(1,:)=(x0limV(2)-tmpM(1,:))/(x0limV(2)-x0limV(1));%利用随机矩阵tmpM以及x0limV生成xM的第二行
    xM(1,:) = rand(1,m);
else
    ntrans = 2;
    xM(1:2,:)= x0M;   % �?
end
for t=2:n+ntrans
    xM(t,1)=f(cV(1)*xM(t-1,m)+(1-cV(1))*xM(t-1,1));
    for im=2:m
        xM(t,im)=f(cV(im)*xM(t-1,im-1)+(1-cV(1))*xM(t-1,im));
    end
end
xM = xM(ntrans+1:n+ntrans,:);

