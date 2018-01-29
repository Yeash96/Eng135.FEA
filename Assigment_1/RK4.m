function [ w ] = RK4(f,a,b,alpha,N)
h = (b-a)/N;
t=a;
w=alpha;
for i=(1:N);
    k1=h*f(t,w);
    k2=h*f(t+h/2,w+k1/2);
    k3=h*f(t+h/2,w+k2/2);
    k4=h*f(t+h,w+k3);
    
    w= w+1/6*(k1+2*k2+2*k3+k4);
    t=a+i*h;
    
end

end

