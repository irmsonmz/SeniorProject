clear all
close all
clc

adhd=zeros(60,1);
saglam=ones(60,1);
sutun=zeros(120,1);

M = adhd
N = saglam
sutun=[M;N];

save('sutun.mat','sutun');