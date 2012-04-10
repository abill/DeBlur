clear variables;
close all;
clc;

im = imread('images\BlurredCars.jpg');
blurmask = DetectMBlur(im);
figure, imshow(blurmask)