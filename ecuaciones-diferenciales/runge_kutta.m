function [t, y] = runge_kutta(f, yo, to, tf, h) 
% Se intentara resolver una edo de la forma dy/dt = f(y, t) 
% to + n*h = tf
% n : pasos = (tf - to)/h

y(1)=yo;

t=to:h:tf;
n=length(t);

for i=1:n-1
    
    k1=feval(f,t(i),y(i));
    k2=feval(f,t(i)+h/2,y(i)+h*k1/2);
    k3=feval(f,t(i)+h/2,y(i)+h*k2/2);
    k4=feval(f,t(i)+h,y(i)+h*k3);

    y(i+1)=y(i)+h/6*(k1+2*k2+2*k3+k4);
    
end

plot(t,y)
% 
% Example 
% An example of a nonstiff system is the system of equations describing the motion of a rigid body without external forces.
% 
% 
% 
% To simulate this system, create a function rigid containing the equations
% 
% function dy = rigid(t,y)
% dy = zeros(3,1);    % a column vector
% dy(1) = y(2) * y(3);
% dy(2) = -y(1) * y(3);
% dy(3) = -0.51 * y(1) * y(2);
% In this example we change the error tolerances using the odeset command and solve on a time interval [0 12] with an initial condition vector [0 1 1] at time 0.
% 
% options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);
% [T,Y] = ode45(@rigid,[0 12],[0 1 1],options);
% Plotting the columns of the returned array Y versus T shows the solution
% 
% plot(T,Y(:,1),'-',T,Y(:,2),'-.',T,Y(:,3),'.')
