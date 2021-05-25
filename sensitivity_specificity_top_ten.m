clear all
close all
clc

top_ten_duyarlilik = importdata('Duyarlilik_smoothdatasiz_SVM.mat');
top_ten_ozgulluk = importdata ('Ozgulluk.mat');

max_duyarlilik1 = top_ten_duyarlilik(1,15);
max_duyarlilik2 = top_ten_duyarlilik(2,23);
max_duyarlilik3 = top_ten_duyarlilik(1,35);
max_duyarlilik4 = top_ten_duyarlilik(1,12);
max_duyarlilik5 = top_ten_duyarlilik(2,17);
max_duyarlilik6 = top_ten_duyarlilik(3,21);
max_duyarlilik7 = top_ten_duyarlilik(3,45);
max_duyarlilik8 = top_ten_duyarlilik(1,47);
max_duyarlilik9 = top_ten_duyarlilik(1,51);
max_duyarlilik10 = top_ten_duyarlilik(2,58);
 
ten_duyarlilik = [max_duyarlilik1;max_duyarlilik2;max_duyarlilik3;max_duyarlilik4;max_duyarlilik5;
                  max_duyarlilik6;max_duyarlilik7;max_duyarlilik8;max_duyarlilik9;max_duyarlilik10];
 
max_ozgulluk1 = top_ten_ozgulluk(1,15);
max_ozgulluk2 = top_ten_ozgulluk(2,23);
max_ozgulluk3 = top_ten_ozgulluk(1,35);
max_ozgulluk4 = top_ten_ozgulluk(1,12);
max_ozgulluk5 = top_ten_ozgulluk(2,17);
max_ozgulluk6 = top_ten_ozgulluk(3,21);
max_ozgulluk7 = top_ten_ozgulluk(3,45);
max_ozgulluk8 = top_ten_ozgulluk(1,47);
max_ozgulluk9 = top_ten_ozgulluk(1,51);
max_ozgulluk10 =top_ten_ozgulluk(2,58);
 
ten_ozgulluk = [max_ozgulluk1;max_ozgulluk2;max_ozgulluk3;max_ozgulluk4;max_ozgulluk5;
                max_ozgulluk6;max_ozgulluk7;max_ozgulluk8;max_ozgulluk9;max_ozgulluk10];
             
save('top_ten_duyarlilik.mat','ten_duyarlilik');
save('top_ten_ozgulluk.mat','ten_ozgulluk');

