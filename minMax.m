function [vmin,vmax]=minMax(vect)
clc

t=size(vect);
auxma=0; auxmi=0;
vmax=vect(1);
vmin=vect(1);

for i= 1:t(2)
   v2=vect(i);
    if vmax>v2
        vmax=vmax;
    else
        vmax=v2;
    end   
    
     if vmin<v2
        vmin=vmin;
    else
        vmin=v2;
    end

  end

%      vmax;
%      vmin;
end