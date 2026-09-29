clear ;
clc;
im=imread('Capture.JPG');

%Esoger un filtro
filtro=[1 3 3 1; 3 9 9 3;3 9 9 3; 1 3 3 1]/64;


%Aplicar filtro a cada capa
im2(:,:,1)=conv2d(im(:,:,1),filtro);
im2(:,:,2)=conv2d(im(:,:,2),filtro);
im2(:,:,3)=conv2d(im(:,:,3),filtro);

%Montar capas y guardar imagen nueva
imwrite(im2,'newImage.jpg','jpg','Comment','My JPEG file')


%Mostrar imagen filtrada
im2=imread('newImage.jpg');
imshow(im2)

