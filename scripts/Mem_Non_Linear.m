clc;
clear all;
close all;
p=1;
v_d(1)=0;
t = 0:0.000001:1;
f_p=[];
f=2.5;
v = 1*sin(2*pi*t*f);
d = 9*10^(-9);
j=2;
u_v=30*10^-15;
r_on=0.1*10^3;
r_off=16*10^3;
r_i=11000;
f_p=[0:length(t)];
w(1)=((r_off-r_i)/(r_off-r_on))*d;
x(1)=w(1)/d;
m(1)=r_on*(w(1)/d)+r_off*(1-w(1)/d);
% f_p(1)= 1 - (2*x-1)^(2*p);              %Joglekar window i.e. IIR FIlter
% f_p(1)=j*(1 - ((x-0.5)^2+0.75)^p);      %Prodromakis window  i.e. IIR FIlter
for index=2:length(t)
    i(index)=v(index)/m(index-1);
    v_d(index)=(u_v*r_on*i(index)*f_p(index-1))/d;
    w(index)=v_d(index)*(t(index)-t(index-1))+w(index-1);
    x(index)=w(index)/d;
%     f_p(index)=1 - (2*x(index)-1)^(2*p);            %Joglekar window   i.e. IIR FIlter
%    f_p(index)=j*(1 - ((x(index)-0.5)^2+0.75)^p);   %Prodromakis window  i.e. IIR FIlter
    m(index)=r_on*(w(index)/d)+r_off*(1-w(index)/d);
    if m(index)<r_on
        m(index)=r_on;
    end
    if m(index)>r_off
        m(index)=r_off;
    end
    x(index)=w(index)/d;
end
hold on;
title('Memristor non linear boundary drift model')
plot(v,i)
xlabel('Voltage(V)')
ylabel('Current(A)')
grid on;
hold off;