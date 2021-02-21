clear ;
clc;
im=imread('Capture2.JPG');
%imagen a escala de grises
im=rgb2gray(im);
imRuido=imnoise(im,'salt & pepper',0.05);
imCorregida=medfilt2(imRuido);
imshowpair(imRuido,imCorregida,'montage');