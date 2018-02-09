clc
clear all
close all
format long

%given constants
E=30000;
I=800;
w=1;
l=10;
%ODE using finite difference
% parameters
x_i=0;
x_f=l;

dx=0.01;

x=x_i:dx:x_f;

%initializing the matrices

A=zeros(length(x),length(x));
c(1:length(x),1)=(w*l*x./2)-(w*x.^2/2);

%Boundary conditons

A(1,1)=1;
c(1,1)=0;


A(length(x),length(x))=1;
c(length(x),1)=0;

%internal points
for i=2:length(x)-1
    
    A(i,i+1)=E*I/(dx^2);
    A(i,i)=(-2*E*I/dx^2);
    A(i,i-1)=E*I/dx^2;
  
end

U=A\c; %A inverse *c

figure(1)
plot(x,U,x,(w*l*x.^3./(12*E*I))-(w*x.^4./(24*E*I))-(w*l^3*x./(24*E*I)));
legend('FDM','solution')
legend('FDM','solution')
xlabel('length [m]')
ylabel('length [ft]]')
title('comparison')

figure(2)
subplot(2,1,1)
plot(x,U)
legend('FDM','solution')
xlabel('length [ft]')
ylabel('length [ft]')
title('FDM')
subplot(2,1,2)
plot(x,(w*l*x.^3./(12*E*I))-(w*x.^4./(24*E*I))-(w*l^3*x./(24*E*I)));
legend('FDM','solution')
xlabel('length [ft]')
ylabel('length [ft]')
title('Solution')
