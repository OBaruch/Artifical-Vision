clc
clear
%plot3(x,y,z)__________________________________________________________________________
x=[-10:1:10]
y=[-10:4:10]
z=x.^2+y.^2

plot3(x,y,z)
grid on;
xlabel('Ejex');
ylabel('Ejey');
zlabel('Ejez');
title('Grafica 3D');



%plotear 3D con meshrid_____________________________
%     puntosX = [-10:1:10]
%     putnosY = [-10:1:10]
% 
%     [X,Y]=meshgrid(puntosX,puntosY);
%     Z=X.^2-Y.^2;
% 
%     mesh(X,Y,Z)
%     xlabel('Ejex');
%     ylabel('Ejey');
%     zlabel('Ejez');
%     title('Grafica 3D Meshgrid');

%Guardar variables del Worckspace
%save('miarchivo.mat')

%acceder a archivos
%ls *.mat                          (*.mat)es un flito de busqueda 
%