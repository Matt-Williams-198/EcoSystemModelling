InitialPredatorPopulations = 1;%, 2, 2];
InitialPreyPopulations = [70, 50];
TimeStep = 0.01;
FinalTime = 5000;
CurrentTime = linspace(0.0,FinalTime,FinalTime/TimeStep);
CurrentTime = round(CurrentTime,3);
PreyGrowthRates = [20, 30];
PredatorGrowthRates = [0.005, 0.003];%; 0.01, 0.01;  0.02, 0.02];
RemovalInterval = 10;
RemovalProportions = 0.4;
Predation1Rates = 0.1;%, 0.4, 0.05];
Predation2Rates = 0.15;%, 0.2, 0.05];
PreyCarryingCapacities = [100, 60];
PreyCompetitionCoefficients = [0.01, 0.02];
PredatorCompetitionCoefficients = 0.0;%, 0.2, 0.2];
PredatorDeathRates = 0.1;%, 0.1, 0.1];
TimeEvolvedPopulations = zeros(3,FinalTime);
TimeEvolvedPopulations(1,1) = InitialPreyPopulations(1);
TimeEvolvedPopulations(2,1) = InitialPreyPopulations(2);
TimeEvolvedPopulations(3,1) = InitialPredatorPopulations(1);
%TimeEvolvedPopulations(4,1) = InitialPredatorPopulations(2);
%TimeEvolvedPopulations(5,1) = InitialPredatorPopulations(3);
for i = 2 : FinalTime
    [TimeEvolvedPopulations(:,i)] = TimeEvolvedPredatorPreySystem( ...
                                    [TimeEvolvedPopulations(1, i-1),TimeEvolvedPopulations(2,i-1)], ...
                                    InitialPredatorPopulations, ...
                                    TimeEvolvedPopulations(3,i-1), ... TimeEvolvedPopulations(4,i-1), TimeEvolvedPopulations(5,i-1)], ...
                                    TimeStep, ...
                                    CurrentTime(i), ...
                                    PreyGrowthRates, ...
                                    PredatorGrowthRates, ...
                                    RemovalInterval, ...
                                    RemovalProportions, ...
                                    Predation1Rates, ...
                                    Predation2Rates, ...
                                    PreyCarryingCapacities, ...
                                    PreyCompetitionCoefficients,...
                                    PredatorCompetitionCoefficients,...
                                    PredatorDeathRates);
    for j = 1:length(TimeEvolvedPopulations(:,i))
        if TimeEvolvedPopulations(j,i) < 10^(-1)
            TimeEvolvedPopulations(j,i) = 0;
        end
    end
end
%y0 = horzcat(InitialPreyPopulations,InitialPredatorPopulations);
%[t,y] = ode45(@(t,y) TimeEvolvedPopulations([y(1),y(2)], ...
%                                    InitialPredatorPopulations, ...
 %                                   [y(3), y(4), y(5)], ...
  %                                  TimeStep, ...
   %                                 t, ...
    %                                PreyGrowthRates, ...
     %                               PredatorGrowthRates, ...
      %                              RemovalInterval, ...
       %                             RemovalProportions, ...
        %                            Predation1Rates, ...
         %                           Predation2Rates, ...
          %                          PreyCarryingCapacities, ...
           %                         PreyCompetitionCoefficients,...
            %                        PredatorCompetitionCoefficients,...
             %                       PredatorDeathRates), [0,26], y0);

XData = linspace(0, FinalTime/RemovalInterval*TimeStep,FinalTime);
PredatorCarryingCapacity = zeros(4,FinalTime);
SteadyStatePrey1 = false;
SteadyStatePrey2 = false;
SteadyStatePredator = false;
tolerance = 0.1;
for i = 1:FinalTime-RemovalInterval
    %PredatorCarryingCapacity(1,i) = (PredatorGrowthRates(1) * TimeEvolvedPopulations(1,i))/Predation1Rates(1) + ...
     %                           (PredatorGrowthRates(2) * TimeEvolvedPopulations(2,i))/Predation2Rates(1);
    %PredatorCarryingCapacity(2,i) = (PredatorGrowthRates(1) * TimeEvolvedPopulations(1,i))/Predation1Rates(2) + ...
     %                           (PredatorGrowthRates(2) * TimeEvolvedPopulations(2,i))/Predation2Rates(2);
    %PredatorCarryingCapacity(3,i) = (PredatorGrowthRates(1) * TimeEvolvedPopulations(1,i))/Predation1Rates(3) + ...
      %                          (PredatorGrowthRates(2) * TimeEvolvedPopulations(2,i))/Predation2Rates(3);

    if i < FinalTime - RemovalInterval
        if TimeEvolvedPopulations(1,i) < TimeEvolvedPopulations(1,i+RemovalInterval)+tolerance
            if TimeEvolvedPopulations(1,i) > TimeEvolvedPopulations(1,i+RemovalInterval)-tolerance
                SteadyStatePrey1 = true;
                SteadyStatePrey1Time = i;
            end
        end
        if TimeEvolvedPopulations(2,i) < TimeEvolvedPopulations(2,i+RemovalInterval)+tolerance
            if TimeEvolvedPopulations(2,i) > TimeEvolvedPopulations(2,i+RemovalInterval)-tolerance
                SteadyStatePrey2 = true;
                SteadyStatePrey2Time = i;
            end
        end
        if TimeEvolvedPopulations(3,i) < TimeEvolvedPopulations(3,i+RemovalInterval)+tolerance
            if TimeEvolvedPopulations(3,i) > TimeEvolvedPopulations(3,i+RemovalInterval)-tolerance
                SteadyStatePredator = true;
                SteadyStatePredatorTime = i;
            end
        end
    end
end
%TimeEvolvedPopulations(1,:) = TimeEvolvedPopulations(1,:)/PreyCarryingCapacities(1);
%TimeEvolvedPopulations(2,:) = TimeEvolvedPopulations(2,:)/PreyCarryingCapacities(2);
%TimeEvolvedPopulations(3,:) = TimeEvolvedPopulations(3)./ PredatorCarryingCapacity(1,:);
%TimeEvolvedPopulations(4,:) = TimeEvolvedPopulations(4)./ PredatorCarryingCapacity(2,:);
%TimeEvolvedPopulations(5,:) = TimeEvolvedPopulations(5)./ PredatorCarryingCapacity(3,:);
figure
plot(XData,TimeEvolvedPopulations(1,:),"DisplayName","Prey 1 Population")
hold on
plot(XData,TimeEvolvedPopulations(2,:))
plot(XData,TimeEvolvedPopulations(3,:))
%plot(XData,TimeEvolvedPopulations(4,:))
%plot(XData,TimeEvolvedPopulations(5,:))
title('Population Evolution Over Time')
xlabel('Time/Removal Interval')
ylabel('Population/Carrying Capacity')%','Wolves','Tigers'
legend('Sheep','Rabbits','Foxes')
