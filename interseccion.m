function [h]=interseccion(vec1,vec2)
clc
% vec1=[1 0 2 2 0 6 8 6 1 4 8];
% vec2=[1 1 1 1 2 3 0 4 8];
vec3=[];
vectN=[];
t=length(vec1);
t1=length(vec2);
h=[];
c=0;


for i=1:t
aux=vec1(i);
       
     kkk=0;
     for j=1:t1
         if aux==vec2(j)
            c=1;
            
         end
     end
     
           if c==1
              
          vectN=[vectN aux];
              
          c=0; 
          
          
           end
  
  
            
end 

vG=vectN;
n=length(vG);
vR=[];
for i=1:n
    
    if i==1
       vR=[vR vG(i)];
    else 
     h=length(vR);
     cont=0;
         for k=1:h
              if vG(i)~=vR(k)
                cont=cont+1;
              end
         end
         
         if cont==h
            vR=[vR vG(i)];
         end
    end
end
h=vR;
%vR

end 
