%clear all;
close all;
clc;
im=imread('images/blurhorz.BMP');
mask = (rgb2gray(im) ~= 255);
psf=getPSF(im,mask);
[s1 s2]=size(psf);
psf=[zeros(s1,1) psf zeros(s1,1)];
psf=[zeros(1,s2+2)
    psf
    zeros(1,s2+2)];
[s1 s2]=size(psf);
psf=psf.*255;
psfcol=zeros(s1,s2,3);
psfcol(:,:,1)=psf(:,:);
psfcol(:,:,2)=psf(:,:);
psfcol(:,:,3)=psf(:,:);
im(1:35,1:20,:)=zeros(35,20,3);
im(1:s1,1:s2,:)=psfcol;
%psf = ones(30,1);
%psf = psf./30;
figure,imshow(im);
%d = deconvlucy(im,psf,80);
%figure, imshow(d)
% imwrite(im,'res3.bmp');