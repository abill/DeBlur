clear variables;
close all;
clc;
im=imread('images/blurhorz.BMP');
mask = (rgb2gray(im) ~= 255);
psf=getPSF(im,mask);

[s1 s2]=size(psf);
visualPsf=[zeros(s1,1) psf zeros(s1,1)];
visualPsf=[zeros(1,s2+2)
    visualPsf
    zeros(1,s2+2)];
[s1 s2]=size(visualPsf);
visualPsf=int8(round(visualPsf.*255*13));
psfcol=zeros(s1,s2,3);
psfcol(:,:,1)=visualPsf(:,:);
psfcol(:,:,2)=visualPsf(:,:);
psfcol(:,:,3)=visualPsf(:,:);
im(1:35,1:20,:)=zeros(35,20,3);
im(1:s1,1:s2,:)=psfcol;

figure,imshow(im);
%d = deconvlucy(im,psf,80);
%figure, imshow(d)
% imwrite(im,'res3.bmp');