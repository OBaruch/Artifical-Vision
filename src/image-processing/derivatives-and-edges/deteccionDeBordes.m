
 clc 
 clear
A=imread('Capture.JPG');
A=rgb2gray(A);

filtro=[1 3 3 1; 3 9 9 3;3 9 9 3; 1 3 3 1]/64;

%Borde con negativo del suavizador
im=imfilter(A,filtro);I5=(im-A)*30;

%bordes con metodos caliscos 
I1=edge(im,'Prewitt','both');
I2=edge(im,'sobel','both');
I3=edge(im,'log','both');
I4=edge(im,'Canny','both');	

I6=I1+I2+I3+I4;

imshow(I6);
