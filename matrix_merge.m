clear all
close all
clc

total=zeros(120,38);
totalson=zeros(120,57);

entropy=importdata('entropy.mat');
lyapunov=importdata('lyapunovyeni.mat');
petrosian=importdata('petrosian.mat');

A = entropy %approximate 120x19
B = lyapunov %lypunov 120x19
total = [A,B];

C = total %ent+lyp
D = petrosian %petrosian 120x19
totalson=[C,D];

save('matrisbirlestirme.mat','totalson');