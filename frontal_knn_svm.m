clear all
close all
clc

%knn
X = importdata('matrisbirlestirme_frontal.mat');
X = normalize(X);
Y = importdata ('sutun.mat');
tur=60

all_accuracies = zeros(3,tur);
duyarlilik = zeros(3,tur);
ozgulluk = zeros(3,tur);

max_acc = 0.00;

for n=1:3
    for i =1:tur
        
        cv = cvpartition(size(X,1),'HoldOut',0.3);
        idx = cv.test;
        % Separate to training and test data
        xTrain = X(~idx,:);
        xTest  = X(idx,:);
        yTrain = Y(~idx,:);
        yTest  = Y(idx,:);

        mdl = fitcknn(xTrain,yTrain,'NumNeighbors',2*n+7,'Standardize',1);

        [label] = predict(mdl,xTest);

        cm = confusionmat(yTest,label);

        %Accuracy (all correct / all) = TP + TN / TP + FP + FN + TN

        acc_n = (cm(1) + cm(4)) / (cm(1) + cm(2) + cm(3) + cm(4));

        A = sprintf('%d. komsu icin accuracy : ', 2*n+7);
        disp (A);
        disp(acc_n);
        
        if max_acc<acc_n
            max_acc = acc_n;
        end
        
        all_accuracies(n,i)=acc_n;
        duyarlilik(n,i) = ( cm(1) / ( cm(1) + cm(3))) * 100;
        ozgulluk(n,i) = ( cm(4) / (cm(2) + cm(4))) * 100;
        
        %duyarlilik ve ozgulluk bastirma
        D = sprintf( 'Duyarlilik = %.2f', duyarlilik(n,i));
        disp (D);
        O = sprintf( 'Ozgulluk = %.2f', ozgulluk(n,i));
        disp (O);
        
        %SVM
        
        SVMModel = fitcsvm(xTrain,yTrain);

        [label] = predict(SVMModel,xTest);

        cmsvm = confusionmat(yTest,label);
        
        acc_svm(1,i) = (cmsvm(1) + cmsvm(4)) / (cmsvm(1) + cmsvm(2) + cmsvm(3) + cmsvm(4));
        duyarlilik_svm(1,i) = ( cmsvm(1) / ( cmsvm(1) + cmsvm(3))) * 100;
        ozgulluk_svm(1,i) = ( cmsvm(4) / (cmsvm(2) + cmsvm(4))) * 100;
        
    end
end

disp('maximum accuracy is : ');
disp(max_acc*100);

save('frontal_KNN_smoothdatasiz.mat','all_accuracies');
save('frontal_Duyarlilik_smoothdatasiz.mat','duyarlilik');
save('frontal_Ozgulluk_smoothdatasiz.mat','ozgulluk');
save('frontal_SVM_smoothdatasiz.mat','acc_svm');
save('frontal_Duyarlilik_smoothdatasiz_SVM.mat', 'duyarlilik_svm');
save('frontal_Ozgulluk_smoothdatasiz_SVM.mat', 'ozgulluk_svm');