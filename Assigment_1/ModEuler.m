function [ E ] = ModEuler(f,a,b,alpha,N,h)
t=a; % start point labeled as t
w=alpha; % initial value is now w
for i=(1:N)
    z=w+h*f(t,w); % inital eulers method to find y*i+1
    y=w+h*((f(t,w)+f(t,z))/2);% final solution to find real yi+1
    E(i)=y;% records solutions to return
    w=y; % re assign vaules for next loop
    
    t=a+i*h; % step foward 
end

end
    