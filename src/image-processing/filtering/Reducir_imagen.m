clear ;
clc;
im=imread('Capture.JPG');

%Reducir la imagen en todas sus capas
im2(:,:,1)=im(1:2:end,1:2:end,1);
im2(:,:,2)=im(1:2:end,1:2:end,2);
im2(:,:,3)=im(1:2:end,1:2:end,3);

%Montar capas y guardar imagen nueva
imwrite(im2,'newImage2.jpg','jpg','Comment','My JPEG file')


%Mostrar imagen filtrada
im2=imread('newImage2.jpg');
imshow(im2)