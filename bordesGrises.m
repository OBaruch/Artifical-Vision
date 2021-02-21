clear ;
clc;
im=imread('Capture.JPG');

%Esoger un filtro
filtro=[1 3 3 1; 3 9 9 3;3 9 9 3; 1 3 3 1]/64;

%imagen a escala de grises
im=rgb2gray(im);

%aplicar filtro
im2=imfilter(im,filtro);

%restar el suavizado a la original en cada capa en una nueva imagen
im3=im-im2;

imshow(im3);