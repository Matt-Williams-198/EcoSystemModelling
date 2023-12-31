InitialPredatorpopulationIterations = 120;
SystemCollapse = zeros(InitialPredatorpopulationIterations,1);
InitialPredatorPopulations = 1;
InitialPreyPopulations = [30, 50];
TimeStep = 0.1;
FinalTime = 1000;
CurrentTime = linspace(0.0,FinalTime,FinalTime/TimeStep);
CurrentTime = fix(CurrentTime);
PreyGrowthRates = [2, 3];
PredatorGrowthRates = [0.01, 0.01];
RemovalInterval = 10;
RemovalProportions = 0.0;
Predation1Rates = 0.1;
Predation2Rates = 0.1;
PreyCarryingCapacities = [100, 100];
PreyCompetitionCoefficients = [0.1, 0.2];
PredatorCompetitionCoefficients = 0.0;
PredatorDeathRates = 0.1;
TimeEvolvedPopulations = zeros(3,FinalTime);
TimeEvolvedPopulations(1,1) = InitialPreyPopulations(1);
TimeEvolvedPopulations(2,1) = InitialPreyPopulations(2);

for j = 1 : InitialPredatorpopulationIterations
    TimeEvolvedPopulations(3,1) = j;
    for i = 2 : FinalTime
        [TimeEvolvedPopulations(:,i)] = TimeEvolvedPredatorPreySystem( ...
                                        [TimeEvolvedPopulations(1,i-1),TimeEvolvedPopulations(2,i-1)], ...
                                        InitialPredatorPopulations, ...
                                        TimeEvolvedPopulations(3,i-1), ...
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
        mod(CurrentTime(i), RemovalInterval);

    end        

    if TimeEvolvedPopulations(1,FinalTime) < 1
        SystemCollapse(j) = 1;
    end
    if TimeEvolvedPopulations(2,FinalTime) < 1
        SystemCollapse(j) = 2;
    end
    if TimeEvolvedPopulations(1,FinalTime) < 1 && TimeEvolvedPopulations(2,FinalTime) < 1
        SystemCollapse(j) = 3;
    end
end