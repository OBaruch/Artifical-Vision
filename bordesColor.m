clear ;
clc;
im=imread('Capture2.JPG');

%Esoger un filtro
filtro=[1 3 3 1; 3 9 9 3;3 9 9 3; 1 3 3 1]/64;


%Aplicar filtro a cada capa
im2(:,:,1)=conv2d(im(:,:,1),filtro);
im2(:,:,2)=conv2d(im(:,:,2),filtro);
im2(:,:,3)=conv2d(im(:,:,3),filtro);

%restar el suavizado a la original en cada capa en una nueva imagen
im3(:,:,1)=im(:,:,1)-im2(:,:,1);
im3(:,:,2)=im(:,:,2)-im2(:,:,2);
im3(:,:,3)=im(:,:,3)-im2(:,:,3);

%Montar capas y guardar imagen nueva im3 (bordes)
imwrite(im3,'newImage.jpg','jpg','Comment','My JPEG file')


%Mostrar imagen filtrada
im3=imread('newImage.jpg');
imshow(im3)