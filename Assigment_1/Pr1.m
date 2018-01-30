clc
clear all
close all

f=@(x,y)4*exp(0.8*x)-0.5*y;
alpha=2;
a=0;
b=2;
N=200;%number of iteration N= 1/h h is the step size
h=0.01;

x=linspace(0,2,200);
Eurz=Euler(f,a,b,alpha,N,h);
MEZ=ModEuler(f,a,b,alpha,N,h);
RK4z=RK4(f,a,b,alpha,N,h);
[t,y]=ode45(f,[0,2],2);

plot(x,Eurz,x,MEZ,x,RK4z,t,y);
legend('euler','ModEuler','RK4','ode45','Location','NorthWest')
