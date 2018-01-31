clc
clear all
close all

%given stuff
f=@(x,y)4*exp(0.8*x)-0.5*y; %function
alpha=2;%initial value
a=0;%start point
b=2;%end point
N=200;%number of iteration N= (b-a)/h h is the step size
h=0.01; %step value

x=linspace(0,2,200);%x values,
Eurz=Euler(f,a,b,alpha,N,h); %fuction returns 1x200 array using euler method
MEZ=ModEuler(f,a,b,alpha,N,h); %fuction returns 1x200 array using mod.euler method
RK4z=RK4(f,a,b,alpha,N,h); %fuction returns 1x200 array using runga-kutta 4 method
[t,y]=ode45(f,[0,2],2); %matlabs ode function solver returns t=45x1, y=45x1 array

%graphing stuff
figure(1)
plot(x,Eurz,'--',x,MEZ,':',x,RK4z,'-.',t,y);
legend('euler','ModEuler','RK4','ode45','Location','NorthWest')
xlabel('x')
ylabel('y')
title('problem.1 /n f=4*exp(0.8*x)-0.5*y')

figure(2)
subplot(2,2,1)
plot(t,y)
title('ode45')
xlabel('x')
ylabel('y')
subplot(2,2,2)
plot(x,Eurz)
title('Euler')
xlabel('x')
ylabel('y')
subplot(2,2,3)
plot(x,MEZ)
title('Mod.Euler')
xlabel('x')
ylabel('y')
subplot(2,2,4)
plot(x,RK4z)
title('RK4')
xlabel('x')
ylabel('y')

