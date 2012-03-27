clear all;
% close all;
clc;
a = imread('images/noblur1.BMP');
psf = ones(30,1);
psf = psf./30;
b = imfilter(a,psf);
figure, imshow(b);
c = deconvlucy(b,psf,80);
figure, imshow(c)