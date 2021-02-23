clc
close all
Ron=100;
Roff=16*10^3;
D=10*10^-9;
f=0.477;
ud=1*10^-10;
r=Roff/Ron;
Qd=D^2/(ud*Ron);
t = 0:0.0001:4;
v = sin(2*pi*f*t);
flux1 =  sin(2*pi*f*x);
flux=integral(flux1,0,length(t));
%flux=(-1.5/2*pi*f)*cos(2*pi*f*t);
%qt = Qd(1-(sqrt(1-((2.*flux)/(Qd*Roff)))));

for index=1:length(t)
    Mq(index) = Roff*(sqrt(1-((2*ud.*flux(index))/(r*D^2))));
    i(index) = v(index)/Mq(index);
end

plot(flux);



%{
plot(w)
grid on
hold on
plot(v,'--')
plot(w,v)
hold off
figure
grid on
hold on
plot(w,v)
hold off
%}

