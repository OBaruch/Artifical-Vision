function [bordesFuertes]=filtradoHisteresis(Im1)
% Búsqueda de la máxima magnitud del gradiente de toda la imagen.
[m,n]=size(Im1);
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
bordesFuertes=logical(Im2);
end

