figure
plot(TimeEvolvedPopulations(1,:), ...
     TimeEvolvedPopulations(2,:), ...
     "Color","#0072BD", ...
     "LineWidth",0.5)
title('Phase Space Of Sheep And Rabbit Population')
xlabel('Sheep Population/Carrying Capacity')
ylabel('Rabbit Population/Carrying Capacity')
hold on
quiver(TimeEvolvedPopulations(1,2:end), ...
       TimeEvolvedPopulations(2,2:end), ...
       gradient(TimeEvolvedPopulations(1,2:end)), ...
       gradient(TimeEvolvedPopulations(2,2:end)), ...
       "Color","#0072BD", ...
       "LineWidth", 0.1, ...
       "AutoScale","on")
figure
plot(TimeEvolvedPopulations(3,:),TimeEvolvedPopulations(2,:),"Color","#D95319")
title('Phase Space Of Fox And Rabbit Population')
xlabel('Fox Population/Carrying Capacity')
ylabel('Rabbit Population/Carrying Capacity')
hold on
quiver(TimeEvolvedPopulations(3,:), ...
       TimeEvolvedPopulations(2,:), ...
       gradient(TimeEvolvedPopulations(3,:)), ...
       gradient(TimeEvolvedPopulations(2,:)), ...
       "Color","#D95319", ...
       "LineWidth", 0.1, ...
       "AutoScale","on")
figure
plot(TimeEvolvedPopulations(3,:), ...
     TimeEvolvedPopulations(1,:), ...
     "Color","#EDB120", ...
     "LineWidth",0.1)
title('Phase Space Of Fox And Sheep Population')
xlabel('Fox Population/Carrying Capacity')
ylabel('Rabbit Population/Carrying Capacity')
hold on
quiver(TimeEvolvedPopulations(3,:), ...
       TimeEvolvedPopulations(1,:), ...
       gradient(TimeEvolvedPopulations(3,:)), ...
       gradient(TimeEvolvedPopulations(1,:)), ...
       "Color","#EDB120", ...
       "LineWidth", 0.5, ...
       "MaxHeadSize",0.05, ...
       "AutoScale","on")
figure
title('Phase Space Of Fox And Sheep Population')
xlabel('Fox Population/Carrying Capacity')
ylabel('Rabbit Population/Carrying Capacity')
hold on
quiver(TimeEvolvedPopulations(3,:), ...
       TimeEvolvedPopulations(4,:), ...
       gradient(TimeEvolvedPopulations(3,:)), ...
       gradient(TimeEvolvedPopulations(4,:)), ...
       "Color",	"#7E2F8E", ...
       "LineWidth", 0.5, ...
       "MaxHeadSize",0.05, ...
       "AutoScale","on")