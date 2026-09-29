th=(0:360)*pi/180;
x0=[cos(2*th)-sin(0.5*th)];
x00=x0;
x1=[sin(th*.9)+cos(th*.8) cos(th*.5) cos(2*th)+sin(th*.5) x0 sin(th)];
M=length(x0);
N=length(x1);

if M~=N
if M>N
    V=zeros(1,M);
    for i=1:M-N
        x1(N+i)=0;
    end
    %Vector de retrado (el doble del vector mas largo) 
     v2=[-M:1:M]       ;                
  
else
    V=zeros(1,N);      
    for i=1:N-M
        x0(M+i)=0;
    end
        %Vector de retrado (el doble del vector mas largo) 
              v2=[-N:1:N];             
    
end
%Calcule la correlacion entre ambos
cor=corr1d(x1,x0);
%Saca ls posicion del mayor en el vector
[a,b]=max(cor)
%Desface
ret=v2(b)

t1=0:length(x1)-1;
t0=0:length(x00)-1;
ret=1085
t0=t0+ret;
hold on
plot(t1,x1)
plot(t0,x00,'r.')
end





