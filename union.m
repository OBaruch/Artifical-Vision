function [sal]=union(v1,v2) 
vG=[v1 v2];
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

sal=[vR];


