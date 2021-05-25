clear all
close all
clc

totalshent = zeros(120,19);
totalHurst = zeros(120,19);
totalapproxent = zeros(120,19);
%lyapunov=zeros(120,19);

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
    subjectapproxEnt = zeros(1,1);
    subjectshent = zeros(1,19);
    subjectHurst = zeros(1,19);
    
    t=length(epochs)+1;
    shent = zeros(1,t);
    Hurst = zeros(1,t);
    
    A = (signal)';
        
    for i = 1:size(A,1)
        ch1 = A(i,:);
        
        for j = 1:length(epochs)
            
            part = ch1(((epochs(j)-1)*fs*dur)+1:(epochs(j)*fs*dur));
            part1 = rmoutliers(part,'median');
            [part2,blabla] = smoothdata(part1,'sgolay');
            
            lyapExp = lyapunovExponent(part2,fs);
            
            approxEntmat(1,j) = lyapExp;
        end
        subjectapproxEnt(1,i) = mean(approxEntmat);
    end
    lyapunov(m,:)=subjectapproxEnt
end
save('lyapunov.mat','lyapunov');
