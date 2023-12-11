function [NewPopulation] = LogisticPreyPopulationChange(Population, ...
                                                        Population2, ...
                                                        TimeStep, ...
                                                        GrowthConstant,...
                                                        InterferenceConstant,...
                                                        CarryingCapacity, ...
                                                        PredationMortality, ...
                                                        PredatorPopulation)
    %NewPopulation = TimeStep*((GrowthConstant*Population)*(CarryingCapacity-Population) - PredationMortality*(PredatorPopulation));
    NewPopulation = TimeStep*(GrowthConstant*Population*(1-(Population + (InterferenceConstant*Population2))/CarryingCapacity) - (PredationMortality * Population * PredatorPopulation));
    if NewPopulation < 0
        NewPopulation = 0;
    end
    return
end
