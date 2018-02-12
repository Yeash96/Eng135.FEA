clear all
clc

%Axial load problem
% Parameters

E=100*10^6;
L=1;
A=5*10^-4;
F=20000;

%dx=0.25; % element size

N=50;
x=linspace(0,L,N);
%x=0:dx:L;

%matrices initializataion

S= zeros(length(x),length(x)); %stiffness matrix
C=zeros(length(x),1);

% calculating K
for i=1:length(x)-1
    k(i)=E*A/(x(i+1)-x(i));
end

%boundary conditions
S(1,1)=1;
S(length(x),length(x)-1)=-k(4);
S(length(x),length(x))=k(4);
C(length(x),1)=F;

for i=2:length(x)-1
    
    S(i,i-1)=-k(i-1);
    S(i,i)=k(i-1)+k(i);
    S(i,i+1)=-k(i);
    
end

U=S\C