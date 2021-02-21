im1=imread('Capture3.JPG');
%im2=imread('fondo.jpg');

[x,y,z]=size(im1);

%remover fondo de pantalla verde
%busca los pixeles en el color verde(2) mayores de 180
ig=im1(:,:,2)>180;
%regresa la imagen afromato uint por la consecuencia del paso anterior
mask=uint8(ig)*255;
%se le resta la maskara a todos los canales para limpiar el color verde
im1(:,:,1)=im1(:,:,1)-mask;
im1(:,:,2)=im1(:,:,2)-mask;
im1(:,:,3)=im1(:,:,3)-mask;



%montar la maskara en el fondo
for i=1:x
    for j=1:y
        if im1(i,j)~=0
          im2(i,j,1)=im1(i,j,1);
          im2(i,j,2)=im1(i,j,2);
          im2(i,j,3)=im1(i,j,3);
        end
        
    end
    
end

imshow(im2)



