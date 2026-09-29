% clc
% clear
% num=5
% function a = factorial(num)
% a=1;
% for i=1: n
%         a=a*i;
%     end  
% end



clc
clear

n=5
function y = factorial(n)
if n==0||n==1
    y=n;
else
    y=n*factorial(n-1);
end


