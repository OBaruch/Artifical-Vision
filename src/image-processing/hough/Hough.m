%Tranformada de Hough

%function [ImH]=Hough(Im)  %Entra una imagen de bordes
    Im=zeros(60,40,'uint8');
    Im(20,30)=255;
    Im(50,30)=255;
    [x,y]=size(Im);
   
    v=zeros(180,180);
    for i=1:x %%Recorrer la imagen 
        for j=1:y %%Recoger la imagen
            if(Im(i,j)==255)                %Para cada borde de la imagen(solo bordes (pixeles blancos))
                for t=-90:90
                    p=abs(round(x*cos(t)+y*sin(t)));
                    %%%
                    v(p,t+91)=v(p,t+91)+1;
                end
                %budcar el vlaor maximo de la matriz
                %calcular la raya de esos valores x y y
            end
        end
    end
%end