clc
clear
im=imread('KDGf2Nkg.png');
% im=rgb2gray(im);
imshow(im)
C = corner(im);
hold on
plot(C(:,1),C(:,2),'b.');

%///////////////////////////////////////////

% im=imread('KDGf2Nkg.png');
% % im=rgb2gray(im);
% [Ix Iy]=derivadaImagen(im);
% Ix2=Ix.*Ix;
% Iy2=Iy.*Iy;
% Ixy=Ix.*Iy;
% 
% %Calcular filtro gausseano
% x=(-2:2);
% g=((1)/(sqrt(2.*pi))).*exp((-x.^2)/(2));
% Gx=[0.0540    0.2420    0.3989    0.2420    0.0540];
% Gy=Gx';
% Gau=Gy.*Gx;
% G=(1/0.9819).*Gau;
% sum(G(:));
% %%%%%
% 
% sx2=conv2(Ix2,G,'same');
% sy2=conv2(Iy2,G,'same');
% sxy=conv2(Ixy,G,'same');
% 
% 
% [M,N]=size(im);
% for i=1:M
%     for j=1:N
%         H=[sx2(i,j), sxy(i,j); sxy(i,j), sy2(i,j)];
%         R(i,j)=det(H)-(0.04).*(trace(H)).^2;
%     end
%  
% end
