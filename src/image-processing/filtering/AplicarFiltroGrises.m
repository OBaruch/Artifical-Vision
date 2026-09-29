clear ;
clc;
Im=imread('Capture.JPG');

%Esoger un filtro
%filtro=conv2([1 4 6 4 1],[1 ;4 ;6 ;4 ;1]);
filtro=conv2([1 2 1],[1 ;2 ;1]/16);
%imagen a escala de grises
Im=rgb2gray(Im);

%aplicar filtro
im2=conv2dm(Im,filtro);

imshow(im2);