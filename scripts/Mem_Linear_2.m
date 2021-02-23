clc 
clear
close all
T = 0:0.0001:2;
Ron = 100;
Roff = 160*10^3;
ud = 10^-14;       % Mobility of Electrons
vd(1) = 0;         % Drift velocity of Electrons: Vd=ud*EF
D = 10*10^-9;
f = 3;
Qd = D^2/(ud*Ron);
v(1) = 1;
v = v(1)*sin(2*pi*f*T);
flux = -(1/2*pi*f)*cos(2*pi*f*T);
q(1) = Qd*(1-sqrt(1-((2*flux(1))/(Qd*Roff))));
w(1) = 3*10^-9;
x(1) = w(1)/D;
M(1) = Roff*(1-((ud*Ron*q(1))/D^2));
for t=2:length(T)
    i(t) = v(t-1)/M(t-1);                               % Current
    vd(t) = (ud*Ron*i(t))/D;                            % Drift Velocity
    q(t) = Qd*(1-sqrt(1-((2*flux(t-1))/(Qd*Roff))));    % Charge
    M(t) = Roff*(1-((ud*Ron*q(t))/D^2));                % Memristance
    x(t) = (ud*Ron*q(t))/D^2;                           % State Variable
end    
plot(v);
hold on;
grid on;
plot(i);
hold off;
figure;
hold on;
grid on;
plot(v,i);
hold off;
