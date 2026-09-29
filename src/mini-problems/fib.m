n=3
function y=fib(n)
if n==0
    y=0;
elseif n==1
    y=1;
else
    y=bif(n-1)+bif(n-2);
end
end