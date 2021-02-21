function [vec2]=eliminaNegativos(vec)
%vec=[5 -2 4 0 -3 -6]
x=length(vec);
vec2=[];
for i= 1:x
num=vec(i);

    if num>=0
        vec2=[vec2 num];
    end
       
end
%vec2
end 
