clc
clear all
close all
%Given prameters 
E=110*10^6;
L=2.5;
A1=pi()/4*(18*10^-3)^2;
A2=pi()/4*(12*10^-3)^2;
F=25*10^3;

%step size
dx=0.01;

%discretizes bar
x=0:dx:L;

%matrices initializataion

S= zeros(length(x),length(x)); %stiffness matrix
C=zeros(length(x),1); % load 

% calculating K
for i=1:length(x)-1
   if (x(i)<L/2) % we have two areas at diffrent ends
       k(i)=E*A1/(x(i+1)-x(i));
   else
    k(i)=E*A2/(x(i+1)-x(i));
   end
end

%boundary conditions and filling the ends of the stiffnes matrics 
S(1,1)=1;
S(length(x),length(x)-1)=-k(length(x)-1);
S(length(x),length(x))=k(length(x)-1);
C(length(x),1)=F;

for i=2:length(x)-1 % filling out the rest of the matrix 
    
    S(i,i-1)=-k(i-1);
    S(i,i)=k(i-1)+k(i);
    S(i,i+1)=-k(i);
    
end

U=S\C

plot(x,U)
title('Problem 1.')
xlabel(' length(meter)')
ylabel('displacement(meter)')