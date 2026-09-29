function [ImC]=conv2dz(Im,h)  
    [M,N]=size(Im);
    [m,n]=size(h);
    ImC=zeros(M,N,'uint8');
    % Se agregan ceros a la imagen original y se obtiene el número de lineas
    % agregadas
    ampliado=floor(m/2);
    nH=ampliado*2+M;
    nW=ampliado*2+N;
    zerosIm=zeros(nH,nW);
    zerosIm(ampliado+1:end-ampliado,ampliado+1:end-ampliado)=Im;
    [M,N]=size(zerosIm);
    ImCZ=zeros(M,N,'uint8');
    %Se genera la imagen nuevo, donde se almacenaran los resultados de la
    %convolución
    for i=ampliado+1:M-ampliado
        for j=ampliado+1:N-ampliado
            x=0;
            for k=m:-1:1
                for l=n:-1:1
                    x=x+zerosIm(i-k+ampliado+1,j-l+ampliado+1)*h(k,l);
                end
            end
            ImCZ(i,j)=x;
        end
    end
    ImC=ImCZ(ampliado+1:end-ampliado,ampliado+1:end-ampliado);
end