clear all
close all
clc

acc_svm = importdata('frontal_SVM_smoothdatasiz.mat');
        
n = 10;
[~,sortingIndex] = sort(acc_svm(:),'desc');
[row, col] = ind2sub(size(acc_svm),sortingIndex(1:n));

top_ten_acc = zeros(10,3);
top_five_acc = zeros(5,3);

for i=1:10
   fprintf('%.2f   %d   %d \n',acc_svm(row(i),col(i)),row(i),col(i));
   top_ten_acc(i,1) = acc_svm(row(i),col(i));
   top_ten_acc(i,2) = row(i);
   top_ten_acc(i,3) = col(i);
   if i<6
       top_five_acc(i,1) = acc_svm(row(i),col(i));
       top_five_acc(i,2) = row(i);
       top_five_acc(i,3) = col(i);
   end
end


disp(top_ten_acc)

max_ten_acc = max(top_ten_acc(:,1));
mean_ten_acc = mean(top_ten_acc(:,1));
std_ten_acc = std(top_ten_acc(:,1));

fprintf("maximum of ten max acc %.2f\n",max_ten_acc);
fprintf("mean of ten max acc %.2f\n",mean_ten_acc);
fprintf("standart derivation of ten max acc %.2f\n",std_ten_acc);


max_five_acc = max(top_five_acc(:,1));
mean_five_acc = mean(top_five_acc(:,1));
std_five_acc = std(top_five_acc(:,1));


fprintf("maximum of five max acc %.2f\n",max_five_acc);
fprintf("mean of five max acc %.2f\n",mean_five_acc);
fprintf("standart derivation of five max acc %.2f\n",std_five_acc);


save('Max_10_Acc_of_SVM.mat', 'top_ten_acc');