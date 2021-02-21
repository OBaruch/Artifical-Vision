clear all; close all; clc;
% Cargar imagen en escala de grises.
Im=rgb2gray(imread('clonetrooper.jpg'));
% Filtro Sobel en para derivada en x.
hx=[-1 0 1; -2 0 2; -1 0 1]; 
% Filtro Sobel en para derivada en y.
hy=[-1 -2 -1; 0 0 0; 1 2 1];
% Derivada de la imagen en x.
dx=conv2(Im,hx,'same');
% Derivada de la imagen en y.
dy=conv2(Im,hy,'same');
% Magnitud de los gradientes de la imagen.
MG=sqrt((dx.^2+dy.^2));
% Orientación de los gradientes de la imagen.
OG=atan2(dy,dx)*(180/pi);
% Obtención del tamaño de la matriz de la orientación de los gradientes.
[m,n]=size(OG);
% Conversión de ángulos de orientación de los gradientes de la imagen a positivos.
for i=1:m
    for j=1:n
        if OG(i,j)<0
            OG(i,j)=OG(i,j)+180;
        end
    end
end
% Conversión ángulos de orientación de los gradientes de la imagen a 0°, 45°, 90° y 135°.
for i=1:m
    for j=1:n
        if OG(i,j)<22.5 || OG(i,j)>157.5
            OG(i,j)=0;
        end
        if OG(i,j)<67.5 && OG(i,j)>22.5
            OG(i,j)=45;
        end
        if OG(i,j)<112.5 && OG(i,j)>67.5
            OG(i,j)=90;
        end
        if OG(i,j)<157.5 && OG(i,j)>112.5
            OG(i,j)=135;
        end
    end
end
% Supresión de píxeles que no son máximos locales en su magnitud en la
% orientación del gradiente.
% Creación de la nueva imagen para almacenar los máximos locales.
Im1=zeros(m,n,'uint8');
% Creación de los índices de los píxeles vecinos.
i1=0; j1=0; i2=0; j2=0;
% Supresión de los píxeles que no son máximos locales.
for i=2:m-1
    for j=2:n-1
        if OG(i,j)==0
            i1=i;
            j1=j-1;
            i2=i;
            j2=j+1;
            MGvalues=[MG(i1,j1),MG(i,j),MG(i2,j2)];
            if MGvalues(2)>MGvalues(1) && MGvalues(2)>MGvalues(3)
                Im1(i,j)=MGvalues(2);
            else
                Im1(i,j)=0;
            end
        end
        if OG(i,j)==45
            i1=i-1;
            j1=j+1;
            i2=i+1;
            j2=j-1;
            MGvalues=[MG(i1,j1),MG(i,j),MG(i2,j2)];
            if MGvalues(2)>MGvalues(1) && MGvalues(2)>MGvalues(3)
                Im1(i,j)=MGvalues(2);
            else
                Im1(i,j)=0;
            end
        end
        if OG(i,j)==90
            i1=i-1;
            j1=j;
            i2=i+1;
            j2=j;
            MGvalues=[MG(i1,j1),MG(i,j),MG(i2,j2)];
            if MGvalues(2)>MGvalues(1) && MGvalues(2)>MGvalues(3)
                Im1(i,j)=MGvalues(2);
            else
                Im1(i,j)=0;
            end
        end
        if OG(i,j)==135
            i1=i-1;
            j1=j-1;
            i2=i+1;
            j2=j+1;
            MGvalues=[MG(i1,j1),MG(i,j),MG(i2,j2)];
            if MGvalues(2)>MGvalues(1) && MGvalues(2)>MGvalues(3)
                Im1(i,j)=MGvalues(2);
            else
                Im1(i,j)=0;
            end
        end
    end
end
% Búsqueda de la máxima magnitud del gradiente de toda la imagen.

value=Im1(1,1);
for i=1:m
    for j=1:n
        if Im1(i,j)>value
            value=Im1(i,j);
        end
    end
end
% Definición de umbral alto.
TH=value*0.175;
% Definición de umbral bajo.
TL=value*0.075;
% Creación de la nueva imagen que contendrá el filtrado de histéresis.
Im2=zeros(m,n,'uint8');
% Creación de vector fila auxiliar.
VAux=zeros(1,8);
% Proceso de filtrado de histéresis.
for i=2:m-1
    for j=2:n-1
        if Im1(i,j)>TH
            Im2(i,j)=1;
        else
            if Im1(i,j)<TL
                Im2(i,j)=0;
            else
                VAux(1,1)=Im1(i-1,j-1);
                VAux(1,2)=Im1(i-1,j);
                VAux(1,3)=Im1(i-1,j+1);
                VAux(1,4)=Im1(i,j-1);
                VAux(1,5)=Im1(i,j+1);
                VAux(1,6)=Im1(i+1,j-1);
                VAux(1,7)=Im1(i+1,j);
                VAux(1,8)=Im1(i+1,j+1);
                for k=1:length(VAux)
                    if VAux(k)>TH
                        Im2(i,j)=1;
                    end
                end
            end
        end
    end
end
% Conversión de imagen a logica.
Im2=logical(Im2);
imshow(Im2);