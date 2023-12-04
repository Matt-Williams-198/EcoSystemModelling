Prey1Population = zeros(100);
Prey2Population = zeros(100);
PredatorPopulation = zeros(100);
Prey1Population(1) = 1;
Prey2Population(1) = 1;
PredatorPopulation(1) = 1;
for i = 2:100
    PredatorPopulation(i) = PredatorPopulationChange(PredatorPopulation(i-1), ...
                                                     1.0, ...
                                                     0.01, ...
                                                     0.01, ...
                                                     0.1, ...
                                                     Prey1Population(i-1),...
                                                     Prey2Population(i-1));
    Prey1Population(i) = LogisticPreyPopulationChange(Prey1Population(i-1), ...
                                                      Prey2Population(i-1),...
                                                      1.0, ...
                                                      5.0, ...
                                                      0.2, ...
                                                      1.0, ...
                                                      0.2, ...
                                                      PredatorPopulation(i-1));
    Prey2Population(i) = LogisticPreyPopulationChange(Prey2Population(i-1), ...
                                                      Prey2Population(i-1),...
                                                      1.0, ...
                                                      0.5, ...
                                                      0.2, ...
                                                      1.0, ...
                                                      1.0, ...
                                                      PredatorPopulation(i-1));
end
plot(linspace(0,100),PredatorPopulation);