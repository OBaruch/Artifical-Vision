function [sal]=diferencia(u)
n=length(u)
v=zeros(1,n);
for i=1:n
    if i==n
        v(i)=0;%la ultima posision lo compare con 0 porque se llega al final del vector
    else
    v(i)=u(i+1)-u(i);
    end
end
sal=v;
end

