% �Ŵ��㷨��ʾ , 4������
% ���(x ? 50)^2?����Сֵ��xȡֵ��Χ0��100֮�������
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
    
    
    %%%%  ѡ��
    idx_choose=reshape(randperm(4),2,2);
    cp1=str(idx_choose(:,1),:);  % ѡ�����1
    cp2=str(idx_choose(:,2),:);   % ѡ�����2
    % ���㽻�棬���������
    cros_p1=randperm(length(cp2)-1,1);
    cros_p2=randperm(length(cp2)-1,1);
    
    %%%%  ����
    cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
        cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);];
    cp2_new=[cp2(1,1:cros_p2) cp2(2,cros_p2+1:end);
        cp2(2,1:cros_p2) cp2(1,cros_p2+1:end);];
    
    str_new=[cp1_new;
        cp2_new];
    %%%%  ����
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
    
    c_result=[c_result c]; % ������ʷ����
    c=c_alltemp(idx_b(1:4));
%     if all(diff(c)==0)    % ���и�����ͬ��ʱ����ֹ����
%         break
%     end
    
end
best_result   % ��ʷ����ֵ
c_result   % ��ʷ����
c    % ���մ�����

% % �ڶ���
% str = dec2bin(c)
% idx_choose= [    2     3
%      1     4]
% cp1=str(idx_choose(:,1),:)  % ѡ�����1
% cp2=str(idx_choose(:,2),:)   % ѡ�����2
% % ���㽻�棬���������
% % cros_p1=randperm(6,1)
% % cros_p2=randperm(6,1)
% cros_p1=2;
% cros_p2=3;
% %%%%  ����
% cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
%     cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);]
% bin2dec(cp1)   % ԭʼ����
% bin2dec(cp1_new)  % ������
%
% cp2_new=[cp2(1,1:cros_p1) cp2(2,cros_p1+1:end);
%     cp2(2,1:cros_p1) cp2(1,cros_p1+1:end);]
% bin2dec(cp2)   % ԭʼ����
% bin2dec(cp2_new)  % ������
%
% str_new=[cp1_new;
%     cp2_new]
% bin2dec(str_new)
% %%%%  ����
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
% c_2=c  % ������ʷ����
% c=c_alltemp(idx_b(1:4))
%
% % ������
%
% str = dec2bin(c)
% idx_choose= [    2     3
%      1     4]
% cp1=str(idx_choose(:,1),:)  % ѡ�����1
% cp2=str(idx_choose(:,2),:)   % ѡ�����2
% % ���㽻�棬���������
% % cros_p1=randperm(6,1)
% % cros_p2=randperm(6,1)
% cros_p1=5;
% cros_p2=2;
% %%%%  ����
% cp1_new=[cp1(1,1:cros_p1) cp1(2,cros_p1+1:end);
%     cp1(2,1:cros_p1) cp1(1,cros_p1+1:end);]
% bin2dec(cp1)   % ԭʼ����
% bin2dec(cp1_new)  % ������
%
% cp2_new=[cp2(1,1:cros_p1) cp2(2,cros_p1+1:end);
%     cp2(2,1:cros_p1) cp2(1,cros_p1+1:end);]
% bin2dec(cp2)   % ԭʼ����
% bin2dec(cp2_new)  % ������
%
% str_new=[cp1_new;
%     cp2_new]
% bin2dec(str_new)
% %%%%  ����
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
% c_3=c  % ������ʷ����
% c=c_alltemp(idx_b(1:4))