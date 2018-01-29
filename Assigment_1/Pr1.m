clc
clear all
close all

f=@(x,y)4*exp(0.8*x)-0.5*y;
alpha=2;
a=0;
b=2;
N=100;

x=linspace(0,2,100);
Eurz=Euler(f,a,b,alpha,N);
[t,y]=ode45(f,[0,2],2);

plot(x,Eurz,t,y);
legend('euler','ode45')