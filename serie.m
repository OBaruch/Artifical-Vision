function [Respuesta2]= serie(x,n)
k=0; sal=[];  fac=[];
aux=1; Respuesta=0;
for f= 2:n
    aux=aux*f;
    fac=[fac aux];
end
fac;
while k~=(n+1)
   
    aux=(x^k);
    if k>1
    aux2=aux/fac(k-1);
    else
    aux2=aux/1 ;
    end
    sal=[sal, aux2];
   Respuesta=Respuesta+aux2;
    k=k+1;
    
end
sal;
Respuesta2=Respuesta;
end