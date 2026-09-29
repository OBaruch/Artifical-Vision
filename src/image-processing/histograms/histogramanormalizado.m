function hn=histogramanormalizado(imagen)
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
hn=H/(M*N);
subplot(1,2,1),bar(hn),title('Histograma de imagen normalizado');
end