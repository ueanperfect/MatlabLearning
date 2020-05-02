% 遗传算法演示 , 4个个体
% 求解(x ? 50)^2?的最小值，x取值范围0～100之间的整数
clear
objfun=@(x)(x-50).^2;

c=randperm(100,4)';

best_result=[];
c_result=[];

str00=['0';'0';'0';'0'];

for iter=1:100
    str = dec2bin(c);
    
    while size(str,2)<7
        str=[str00 str];
    end
    
    
    %%%%  选择
    idx_choose=reshape(randperm(4),2,2);
    cp1=str(idx_choose(:,1),:);  % 选择配对1
    cp2=str(idx_choose(:,2),:);   % 选择配对2
    % 单点交叉，交叉点生成
    cros_p1=randperm(length(cp2)-1,1);
    cros_p2=randperm(length(cp2)-1,1);
    
    %%%%  交叉
    cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
        cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);];
    cp2_new=[cp2(1,1:cros_p2) cp2(2,cros_p2+1:end);
        cp2(2,1:cros_p2) cp2(1,cros_p2+1:end);];
    
    str_new=[cp1_new;
        cp2_new];
    %%%%  变异
    n_mute=randperm(numel(str_new),1);
    if str_new(n_mute)=='1'
        str_new(n_mute)='0';
    else
        str_new(n_mute)='1';
    end
    
 
    c_new=bin2dec(str_new);
    c_alltemp=[c;c_new];
    b=objfun(c_alltemp);
    [bbest,idx_b]=sort(b);
    best_result(iter)=bbest(1);
    
    c_result=[c_result c]; % 保存历史数据
    c=c_alltemp(idx_b(1:4));
%     if all(diff(c)==0)    % 所有个体相同的时候终止迭代
%         break
%     end
    
end
best_result   % 历史最优值
c_result   % 历史个体
c    % 最终代个体

% % 第二代
% str = dec2bin(c)
% idx_choose= [    2     3
%      1     4]
% cp1=str(idx_choose(:,1),:)  % 选择配对1
% cp2=str(idx_choose(:,2),:)   % 选择配对2
% % 单点交叉，交叉点生成
% % cros_p1=randperm(6,1)
% % cros_p2=randperm(6,1)
% cros_p1=2;
% cros_p2=3;
% %%%%  交叉
% cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
%     cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);]
% bin2dec(cp1)   % 原始数据
% bin2dec(cp1_new)  % 新数据
%
% cp2_new=[cp2(1,1:cros_p1) cp2(2,cros_p1+1:end);
%     cp2(2,1:cros_p1) cp2(1,cros_p1+1:end);]
% bin2dec(cp2)   % 原始数据
% bin2dec(cp2_new)  % 新数据
%
% str_new=[cp1_new;
%     cp2_new]
% bin2dec(str_new)
% %%%%  变异
% if str_new(9)=='1'
%     str_new(9)='0';
% else
%     str_new(9)='1';
% end
% str_new
%
%
% c_new=bin2dec(str_new)
% c_alltemp=[c;c_new]
% b=objfun(c_alltemp)
% [bbest,idx_b]=sort(b)
%
%
%
% c_2=c  % 保存历史数据
% c=c_alltemp(idx_b(1:4))
%
% % 第三代
%
% str = dec2bin(c)
% idx_choose= [    2     3
%      1     4]
% cp1=str(idx_choose(:,1),:)  % 选择配对1
% cp2=str(idx_choose(:,2),:)   % 选择配对2
% % 单点交叉，交叉点生成
% % cros_p1=randperm(6,1)
% % cros_p2=randperm(6,1)
% cros_p1=5;
% cros_p2=2;
% %%%%  交叉
% cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
%     cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);]
% bin2dec(cp1)   % 原始数据
% bin2dec(cp1_new)  % 新数据
%
% cp2_new=[cp2(1,1:cros_p1) cp2(2,cros_p1+1:end);
%     cp2(2,1:cros_p1) cp2(1,cros_p1+1:end);]
% bin2dec(cp2)   % 原始数据
% bin2dec(cp2_new)  % 新数据
%
% str_new=[cp1_new;
%     cp2_new]
% bin2dec(str_new)
% %%%%  变异
% if str_new(3)=='1'
%     str_new(3)='0';
% else
%     str_new(3)='1';
% end
% if str_new(7)=='1'
%     str_new(7)='0';
% else
%     str_new(7)='1';
% end
% str_new
%
%
% c_new=bin2dec(str_new)
% c_alltemp=[c;c_new]
% b=objfun(c_alltemp)
% [bbest,idx_b]=sort(b)
%
%
%
% c_3=c  % 保存历史数据
% c=c_alltemp(idx_b(1:4))