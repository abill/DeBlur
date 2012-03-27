clear all;
close all;
clc;
b = imread('images/blur2.BMP');
psf = ones(30,1);
psf = psf./30;
c = sticktoblack(b,psf);
figure, imshow(c);
imwrite(c,'images/stickedtoblack.BMP')
d = deconvlucy(c,psf,80);
% d =imfilter(d,fspecial('gaussian',3));
figure, imshow(d)
imwrite(d,'images/resultBlack.BMP')


