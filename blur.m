clear all;
close all;
clc;
b = imread('images/noblur.BMP');
psf = ones(1,10);
psf = psf./10;
d =imfilter(b,psf);
figure, imshow(d)
imwrite(d,'images/blurhorz.BMP')