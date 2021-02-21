clear all; close all; clc;
% Algoritmo detector de esquinas (Harris).
Im=imread('chess.png');
Hx=[-1 0 1; -1 0 1; -1 0 1];
Hy=Hx';
Ix=conv2(double(Im),Hx,'same');
Iy=conv2(double(Im),Hy,'same');
Ix2=Ix.^2;
Iy2=Iy.^2;
Ixy=Ix.*Iy;
x=-2:2;
Gx=(1/sqrt(2*pi*1^2)).*exp(-(x.^2/(2*1^2)));
Gxsum=sum(Gx);
Gx=Gx./Gxsum;
sumatoriaGx=sum(Gx);
Gy=Gx';
G=Gy.*Gx;
Sx2=conv2(double(Ix2),G,'same');
Sy2=conv2(double(Iy2),G,'same');
Sxy=conv2(double(Ixy),G,'same');
[m,n]=size(Im);
k=0.04;
for i=1:m
    for j=1:n
        H=[Sx2(i,j) Sxy(i,j); Sxy(i,j) Sy2(i,j)];
        R(i,j)=det(H)-k*trace(H).^2;
    end
end
Vaux=zeros(1,8);
for i=2:m-1
    for j=2:n-1
        Vaux=[R(i-1,j-1),R(i-1,j),R(i-1,j+1),R(i,j-1),R(i,j+1),R(i+1,j-1),R(i+1,j),R(i+1,j+1)];
        if R(i,j)>=max(Vaux)
            R(i,j)=R(i,j);
        else
            R(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        if R(i,j)<((1/100)*max(R(:)))
            R(i,j)=0;
        end
    end
end
imshow(R>0);