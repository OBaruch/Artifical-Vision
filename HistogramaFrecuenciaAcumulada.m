clc 
clear


%HISTOGRAMA 
A=[6 ,5, 7, 8;5, 9, 8, 7 ;6, 3 ,7, 6 ; 5, 6 ,5, 7 ];
[x, y]=size(A);
histograma2=zeros(1,10);
tam=x*y;
L=9; %color maximo 
for i=1:x
    for j=1:y
        
            histograma2(A(i,j)+1)=histograma2(A(i,j)+1)+1;
        
    end
end  

bar(histograma2)

%Frecuencia acumulada
FA=zeros(1,10);
for i=1:length(histograma2)-1
    FA(i+1)=FA(i)+histograma2(i+1);
end  
FA

FAN=[];
%Frecuencia Acumulada Normlaizada
for j=1:length(FA)
    FAN(j)=FA(j)/tam;
end
FAN

%Sacar nueva imagen normalizada
nimg=zeros(x,y,'uint8')

for k=1:x
    for p=1:y
        nimg(k,p)=L*FAN((A(k,p))+1);
    end
    
end
nimg



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nueva imagen
histogramaN=zeros(1,10);
for i=1:x
    for j=1:y
        
            histogramaN(nimg(i,j)+1)=histogramaN(nimg(i,j)+1)+1;
        
    end
end  

bar(histogramaN)
