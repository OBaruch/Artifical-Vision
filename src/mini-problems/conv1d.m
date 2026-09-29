function z=conv1d(x,h)
M=length(x);
N=length(h);

L=M+N-1;


z=zeros(1,L);

for i=1:M
    for j=1:N
        z(i+j-1)=z(i+j-1)+x(i)*h(j);
    end
end



end
