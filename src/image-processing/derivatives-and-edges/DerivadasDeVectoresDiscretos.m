clc 
clear
A=[9 4 1 0 1 4 9];
f1=[-1 1];
f2=[1 -1];
f3=[1 0 -1];
a=-conv(A,f1,'valid')-1 %Derivada discreta por delante
b=conv(A,f2,'valid')+1 %Derivada discreta por atras 
c=conv(A,f3,'valid')/2 %Derivada discreta centrada 

%%%%%%%%%%%%%
in=-3;
fin=3;

x=in:fin;
y=x.^2;
dy=2*x;
figure;
hold on;

plot(x,dy,'r'); %Derivada continua

plot(-3:2,a,'b'); %Derivada discreta 
plot(-2:3,b,'y');
plot(-2:2,c,'g');


