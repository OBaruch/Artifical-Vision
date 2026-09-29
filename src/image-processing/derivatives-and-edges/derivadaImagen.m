function [x,y]=derivadaImagen(im)
%Derivadad de imagenes con sobel y prewitt

%Sobel
Sx=[-1 0 1;-2 0 2 ;-1 0 1];
Sy=[-1 -2 -1 ; 0 0 0;1 2 1];

% %Prewitt
% Px=[-1 0 1;-1 0 1;-1 0 1];
% Py=[-1 -1 -1; 0 0 0;1 1 1];


% %derivada con sobel 
x=conv2(im,Sx,'same');
y=conv2(im,Sy,'same');
% IS=Ax+Ay;


% %deribada con prewitt
% Ax=conv2(A,Px,'same');
% Ay=conv2(A,Py,'same');
% IP=Ax+Ay;

% imshowpair(IS,IP,'montage');
end
