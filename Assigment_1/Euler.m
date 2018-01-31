function [E] = Euler( f,a,b,alpha,N,h )

t=a; % start point labeled as t
w=alpha; % initial value is now w
for i=(1:N)
    w=w+h*f(t,w); %eulers method formula
    E(i)=w; %records values to return 
    t=a+i*h; % next step
    
end

end

