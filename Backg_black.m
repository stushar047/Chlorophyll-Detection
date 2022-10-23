clc;
clear all;
close all;
Num=3;
for i=3:Num
%Input rgb image and background black
filename=sprintf('S_%d.jpg',i);
im1=imread(filename);
im2=rgb2gray(im1);
T=graythresh(im2);
im3=im2bw(im2,T);
im4=imcomplement(im3);
% im5=wiener2(im4,[1 1]);
im5=imfill(im4,'holes');
% im6=edge(im5,'sobel');
B=cat(3,im5,im5,im5);
IM=immultiply(im1,B);
% imshow(im6)
figure(1)
imshow(im4)
figure(2)
imshow(im5)
figure(3)
imshow(IM)
figure(4)
imshow(im3)
% imwrite(im4,'Spot.jpg')
% imwrite(im5,'SpotRemove.jpg')
% imwrite(IM,sprintf('D%d.jpg',i))
end
