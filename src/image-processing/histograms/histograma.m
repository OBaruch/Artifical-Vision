function h=histograma(imagen)
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
h=H;
subplot(1,2,1),bar(h),title('Histograma de imagen');
end