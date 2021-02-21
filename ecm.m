
function [sal]=ecm(v1,v2)
res=(v1-v2);
x=res.^2;
k=sum(x);
y=vpa(k/length(res));
sal=y;





































