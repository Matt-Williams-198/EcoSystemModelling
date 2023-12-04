clear all

r1=1; r2=1; K1=9; K2=11; a=0.5; b=0.5; e1=1; e2=2; g=1; s1=2; s2=1;

y0 = [2,3,4];
tspan = [0, 1000];

[t,y] = ode45(@(t,y) odefunc3Type1(t,y,r1,r2,K1,K2,a,b,e1,e2,g,s1,s2),tspan,y0);

figure;
% plot(y(:,1),y(:,2),'LineWidth',3); % Plot species 2 population over species 1
quiver(y(1:end,1),y(1:end,2),gradient(y(1:end,1)),gradient(y(1:end,2)), 'LineWidth',2)
grid on
set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 20;
title(ax,"2D quiver plot 1");
xlabel("Species 1",'FontSize',30,Interpreter="latex");
ylabel("Species 2",'FontSize',30,Interpreter="latex");

figure;
% plot(y(:,1),y(:,3),'LineWidth',3); % Plot species 3 population over species 1
quiver(y(1:end,1),y(1:end,3),gradient(y(1:end,1)),gradient(y(1:end,3)), 'LineWidth',2)
grid on
set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 20;
title(ax,"2D quiver plot 2");
xlabel("Species 1",'FontSize',30,Interpreter="latex");
ylabel("Species 3",'FontSize',30,Interpreter="latex");

figure;
% plot(y(:,2),y(:,3),'LineWidth',3); % Plot species 3 population over species 2
quiver(y(1:end,2),y(1:end,3),gradient(y(1:end,2)),gradient(y(1:end,3)), 'LineWidth',2)
grid on
set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 20;
title(ax,"2D quiver plot 3"); 
xlabel("Species 2",'FontSize',30,Interpreter="latex");
ylabel("Species 3",'FontSize',30,Interpreter="latex");

figure;
plot3(y(:,1),y(:,2),y(:,3));
grid on
set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 20;
title(ax,"3D plot");
xlabel("Species 1",'FontSize',30,Interpreter="latex");
ylabel("Species 2",'FontSize',30,Interpreter="latex");
zlabel("Species 3",'FontSize',30,Interpreter="latex");