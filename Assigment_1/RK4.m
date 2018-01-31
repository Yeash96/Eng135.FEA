function [ E ] = RK4(f,a,b,alpha,N,h)
t=a; % start point labeled as t
w=alpha; % initial value is now w
for i=(1:N);
    %runga kutta 4 method
    k1=h*f(t,w); % solving k(n) constants
    k2=h*f(t+h/2,w+k1/2);
    k3=h*f(t+h/2,w+k2/2);
    k4=h*f(t+h,w+k3);
    
    w= w+1/6*(k1+2*k2+2*k3+k4); % putting it all together
    E(i)=w; % record solution to return
    t=a+i*h; % step foward
    
end

end

