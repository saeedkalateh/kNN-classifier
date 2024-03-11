clear
clc
mnistNums=[1:10];
% Assing number of examples
num_train=3000;
num_test=1000;
[train_set,train_labels] = loadMNIST(0,mnistNums);
train_set=train_set(1:num_train,:);
train_labels=train_labels(1:num_train);

if size(train_set,1)==size(train_labels,1)
    disp("Checked: Columns of train_set = columns of train_labels");
end
[test_set,test_labels] = loadMNIST(1,mnistNums);
test_set=test_set(1:num_test,:);
test_labels=test_labels(1:num_test);
if size(train_set,1)==size(train_labels,1)
    disp("Checked: Columns of test_set = columns of test_labels");
end
k=0;
while (k<=0 || k>size(train_set,1))
    k=input("Enter the number k for kNN: ");
end
disp("Checked:  k>0 and k<=cardinality of train_set");
%% Calculating Distances
n=0;
for i=1:size(train_set,1)
   for j=1:size(test_set,1)
       similarity(i,j)=dist_func(train_set(i,:),test_set(j,:));

       disp("Calculating Distances "+num2str((n/(size(train_set,1)*size(test_set,1)))*100)+"%")
       n=n+1;
   end
end
clc;
clearvars n i j;
%% Calculating Argmin of distances
predicted=zeros(1,size(test_set,1));
for i=1:size(test_set,1)
    temp=train_labels(argmin(similarity(:,i),k));
    predicted(i)=count_max(temp);
end
clearvars temp i;
% Calculate accuracy for the specified k value
predicted(2,:)=test_labels';
accuracy=100*sum(predicted(1,:)==predicted(2,:))/size(predicted,2);
disp("Accuracy for k="+num2str(k)+" is: "+num2str(accuracy)+"%");
%% Accuracy for different k values
ii=1;
k_set=[1,2,3,4,5,10,15,20,30,40,50];
for jj=1:length(k_set)
    k=k_set(jj);
    predicted=zeros(1,size(test_set,1));
    for i=1:size(test_set,1)
        temp=train_labels(argmin(similarity(:,i),k));
        predicted(i)=count_max(temp);
    end
    clearvars temp i;
    predicted(2,:)=test_labels';
    accuracy(ii)=100*sum(predicted(1,:)==predicted(2,:))/size(predicted,2);
    disp("Accuracy for k="+num2str(k)+" is: "+num2str(accuracy(ii))+"%");
    ii=ii+1;
end
figure();
plot(k_set, accuracy,"-*");
xlabel("k");ylabel("accuracy");
title(num2str(num_train)+" train and "+num2str(num_test)+" examples");
