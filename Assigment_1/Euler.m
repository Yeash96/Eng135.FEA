function [E] = Euler( f,a,b,alpha,N )
%f= function
%a=initial x
%b= final x
%alpha= given value
%=N= number of iteration
h = (b-a)/N;
t=a;
w=alpha;
for i=(1:N)
    w=w+h*f(t,w);
    t=a+i*h;
    E(i)=w;
    
end

end

