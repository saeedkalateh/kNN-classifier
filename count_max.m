function max_num=count_max(col)
% Using this function, we count number
% They can be from 0 - 10 in the MNIST dataset
%
% max_num=count_max(col)
%
% col is the column of input data
% max_num is the most frequent number

nums=zeros(11,1);
for i=1:11
    nums(i)=sum(col==(i-1));
end
[~,max_]=max(nums);
max_num=max_-1;