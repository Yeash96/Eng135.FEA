clc
clear all
close all
format long

%ODE using finite difference
% parameters
r_i=5;
r_f=8;

dr=0.06;

r=r_i:dr:r_f;

%initializing the matrices

A=zeros(length(r),length(r));
c=zeros(length(r),1);

%Boundary conditons
%u(r=5)= 0.0087

A(1,1)=1;
c(1,1)=0.0087;

%u(r=8)=0.003079

A(length(r),length(r))=1;
c(length(r),1)=0.003079;

%internal points
for i=2:length(r)-1
    
    A(i,i+1)=(1/dr^2+1/(r(i)*dr));
    A(i,i)=(-2/dr^2)+(1/(r(i)*dr))+(1/r(i)^2);
    A(i,i-1)=(1/dr^2);
    
end

U=A\c %A inverse *c

plot(r,U);

% or u =inv(A)*c