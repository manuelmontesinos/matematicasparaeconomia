%% Matemáticas para Economía 
% Capítulo 17
% Dibujar aproximaciones de Taylor en Matlab

close all;
clear;
clc;

%% Desarrollos de Taylor para funciones de una variable

% Función: f(x) = sqrt(9 + x^2)
x = -20:1:20;
f = sqrt(9 + x.^2);

% Aproximación lineal: P1(x) = 4*x/5 + 9/5 
p1 = 4*x/5 + 9/5;

% Aproximación cuadrática: P2(x) = 9/250*x^2 + 128/250*x + 594/250
p2 = 9/250*x.^2 + 128/250*x + 594/250;

% Gráfico
plot(x,f,'Linewidth',1.5)
grid on
hold on
plot(x,p1,'r')
hold on
plot(x,p2,'g')
hold on

xL = xlim;
yL = ylim;
line([0 0], yL,'Color','black');  
line(xL, [0 0],'Color','black');  
legend('$f(x)$','$P_1(x)$','$P_2(x)$','Location','southeast','FontSize', 12,'Interpreter','latex')
xlabel('x')
ylabel('y')
title('$f(x) = \sqrt{9 + x^2}$ y aproximaciones de Taylor','FontSize', 14,'Interpreter','latex')

%% Desarrollos de Taylor para funciones de dos variables

% Función: f(x1,x2) = x1*x2^3 + x2
[x1,x2] = meshgrid(-2:.2:2);                                
z = x1.*x2.^3 + x2;
CZ(:,:,1) = zeros(21); % azul
CZ(:,:,2) = zeros(21);
CZ(:,:,3) = ones(21);

% Aproximación lineal: q1(x1,x2) = x1 + 4*x2 - 3
q1 = x1 + 4*x2 - 3;
CQ1(:,:,1) = ones(21); % rojo
CQ1(:,:,2) = zeros(21);
CQ1(:,:,3) = zeros(21);

% Aproximación cuadrática: q2(x1,x2) = 3*x2^2 + 3*x1*x2 - 2*x1 - 5*x2 + 3
q2 = 3*x2.^2 + 3*x1.*x2 - 2*x1 - 5*x2 + 3;
CQ2(:,:,1) = zeros(21); % verde
CQ2(:,:,2) = ones(21);
CQ2(:,:,3) = zeros(21);

% Gráfico
surf(x1,x2,z,CZ)
hold on
surf(x1,x2,q1,CQ1)
hold on
surf(x1,x2,q2,CQ2)

legend('$f(x_1,x_2)$','$Q_1(x_1,x_2)$','$Q_2(x_1,x_2)$','Location','northeast','FontSize', 12,'Interpreter','latex')
xlabel('x_{1}')
ylabel('x_{2}')
zlabel('f(x_{1},x_{2})')
title('$f(x_1,x_2) = x_1x_2^3 + x_2$ y aproximaciones de Taylor','FontSize', 14,'Interpreter','latex')
