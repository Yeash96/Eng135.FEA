clc
clear all
close all

f=@(t,theta)-2.2067*10^(-12)*(theta^4-81*10^8);
alpha=1200;
a=0;
b=480;
N=48000;
h=0.01;

x=linspace(0,480,48000);
RK4z=RK4(f,a,b,alpha,N,h);
[t,y]=ode45(f,[0,480],1200);

%figure(2)
%subplot(1,2,1)
plot(x,RK4z,t,y);
legend('RK4','ode45')
%subplot(1,2,2)
%plot(x,RK4z);
