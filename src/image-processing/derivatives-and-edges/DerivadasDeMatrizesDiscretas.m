clc 
clear
A=imread('Capture.JPG');
A=rgb2gray(A);


%Normal
f1=[-1 1];
f3=[1 0 -1];
%Transpuesto 
f1t=[-1 1]';
f3t=[1 0 -1]';

DerivadaDelante=abs(-conv2(A,f1,'same')); %Derivada discreta por lado
DerivadaCentro=abs(conv2(A,f3,'same')); %Derivada discreta centrada 

DerivadaDelanteT=abs(-conv2(A,f1t,'same')); %Derivada discreta por lado
DerivadaCentroT=abs(conv2(A,f3t,'same')) ;%Derivada discreta centrada 

B=DerivadaDelante+DerivadaDelanteT; %BORDES DE LA IMAGEN POR EL LADO (derivada [1 -1] o [-1 1])
B2=DerivadaCentro+DerivadaCentroT; %BORDES DE LA IMAGEN CENTRADO (derivada [1 0 -1])


imshowpair(B,B2,'montage');