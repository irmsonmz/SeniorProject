clear all
close all
clc

totalshent = zeros(120,19);
totalHurst = zeros(120,19);
totalapproxent = zeros(120,19);
D= @(L,DeltaN) log10(L)/(log10(L)+log10(L/(L+0.4*DeltaN)));

for m = 1:120
    
    if m<=9
        filename = sprintf('Sub0%d.mat', m);
        
    else
        filename = sprintf('Sub%d.mat', m);
        
    end
    
    signal = importdata(filename);
    fs = 128;
    L = length(signal);
    time = [0:L-1]*1/fs;
    
    dur = 30;
    maxepochno = floor(L/(fs*30));
    epochs = [1:maxepochno];
    
    shentmat = zeros(1,length(epochs));
    Hurstmat = zeros(1,length(epochs));
    approxEntmat = zeros(1,length(epochs));
    subjectapproxEnt = zeros(1,19);
    subjectshent = zeros(1,19);
    subjectHurst = zeros(1,19);
    sifirbirmatrisi=zeros(1,3780);
    fark =zeros(1,3779);
    sayac = 0;
    DeltaN = 0;
    Result = 0;
    
    A = (signal)';
    
    %threshold=std(part2);
    
    for i = 1:size(A,1)
        ch1 = A(i,:);
        
        for j = 1:length(epochs)
            
            part = ch1(((epochs(j)-1)*fs*dur)+1:(epochs(j)*fs*dur));
            part1 = rmoutliers(part,'median');
            [part2,blabla] = smoothdata(part1,'sgolay');
            
            L=length(part2);
            for jj = 1:L
                fark(1,j) = part2(1,j+1) - part2(1,j);
            end
            
            threshold=std(fark);
            binarymath=[];
            binarymath(fark>threshold)=1;
            binarymath(fark<threshold)=-1;
            DeltaN=0;
            
            for n=1:length(binarymath)-1
                if binarymath(n)*binarymath(n+1)<0
                    DeltaN=DeltaN+1;
                end
            end
            
            Result=D(L,DeltaN);
            
            approxEntmat(1,j) = Result;
        end
        
        subjectapproxEnt(1,i) = mean(approxEntmat);
    end
    petrosian(m,:)= subjectapproxEnt  
end



save('petrosian.mat','petrosian');