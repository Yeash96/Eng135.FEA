function [ E ] = ModEuler(f,a,b,alpha,N,h)
%h = (b-a)/N;
t=a;
w=alpha;

for i=(1:N)
    z=w+h*f(t,w);
    y=w+h*((f(t,w)+f(t,z))/2);
    E(i)=y;
    w=y;
    
    t=a+i*h;
end

end
    