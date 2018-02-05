clc
clear all
close all
format long

%given constants
hco=0.01;
ta=20;
%ODE using finite difference
% parameters
x_i=0;
x_f=10;

dx=0.01;

x=x_i:dx:x_f;

%initializing the matrices

A=zeros(length(x),length(x));
c(1:length(x),1)=-hco*ta;

%Boundary conditons

A(1,1)=1;
c(1,1)=40;


A(length(x),length(x))=1;
c(length(x),1)=200;

%internal points
for i=2:length(x)-1
    
    A(i,i+1)=1/(dx^2);
    A(i,i)=(-2/dx^2)+(-hco);
    A(i,i-1)=1/dx^2;
  
end

U=A\c; %A inverse *c

figure(1)
plot(x,U,x,73.4523*exp(0.1*x)-53.4523*exp(-0.1*x)+20);
legend('FDM','solution')
xlabel('length [m]')
ylabel('temp. [Celcius]')
title('comparison')

figure(2)
subplot(2,1,1)
plot(x,U)
legend('FDM','solution')
xlabel('length [m]')
ylabel('temp. [Celcius]')
title('FDM')
subplot(2,1,2)
plot(x,73.4523*exp(0.1*x)-53.4523*exp(-0.1*x)+20);
legend('FDM','solution')
xlabel('length [m]')
ylabel('temp. [Celcius]')
title('Solution')
% or u =inv(A)*c