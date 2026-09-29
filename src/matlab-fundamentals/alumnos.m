function [aprobados,reprobados]=alumnos(vec)
%vec=[60 30 99 100 61 59]
t=size(vec);
aprobados=0; reprobados=0;
for i=1:t(2)
   cal=vec(i)
   
    if cal>59
        aprobados=aprobados+1;
    else
        reprobados=reprobados+1;
        
    end
% aprobados 
% reprobados

end 

