function heq=histogramaecualizado(imagen)
Im=imagen;
H=zeros(1,256);
ImD=double(Im);
[M,N]=size(ImD);
for i=1:M
    for j=1:N
        ImN=ImD(i,j);
        H(ImN+1)=H(ImN+1)+1;
    end
end
Nk1=H;
Rk1=Nk1./numel(Im);
suma=cumsum(Rk1);
Rk2=suma.*256;
heq=Rk2;
subplot(1,2,1),bar(Rk2,Nk1,1),title('Histograma de imagen ecualizado')
end