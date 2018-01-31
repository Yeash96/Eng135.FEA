clc
clear all
close all
%given stuff
f=@(t,theta)-2.2067*10^(-12)*(theta^4-81*10^8);%function
alpha=1200; % initial value
a=0; %start point
b=480; % end point
N=48000; % number of iteration N= (b-a)/h
h=0.01; % step size

x=linspace(0,480,48000); % x values 
RK4z=RK4(f,a,b,alpha,N,h); % Runga-Kutta 4 method returns 1x48000
[t,y]=ode45(f,[0,480],1200); %matlabs ode function solver returns t=41x1, y=41x1 array

% graph stuff 
plot(x,RK4z,t,y,'--');
legend('RK4','ode45')
xlabel('t [Seconds]')
ylabel('\theta [Kelvin]')
title('problem.1 f=-2.2067*10^-12*( \theta ^4-81*10^8)')

