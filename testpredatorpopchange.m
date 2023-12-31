%PredatorPopulationChange([1,2,3],0.002,[1,1,1],[1,1,1],[1,1,1],0,0,[1,1,1])
Populations = [1,2,3];
PredatorCompetitionCoefficients = [1,1,1]
PredatorPopulations = zeros(length(Populations),1);
    for i = 1:length(Populations)
        TotalPredation = 0.0;
        CompetingPredatorsSum = 0.0;
        for j = 1: length(Populations)
            if j ~= i
                CompetingPredatorsSum = CompetingPredatorsSum + Populations(j) * (1-PredatorCompetitionCoefficients(j))
            end
            if j == i
                TotalPredation = TotalPredation + Populations(j) * (1 - PredatorCompetitionCoefficients(j))
            end
        end
        TotalPredation = TotalPredation + CompetingPredatorsSum
        CompetitionTerm = CompetingPredatorsSum/TotalPredation
        Populations
        TimeStep
        Prey1GrowthConstant
        Prey2GrowthConstant
        PredatorMortalityRate
        Prey1Population
        Prey2Population
        PredatorCompetitionCoefficients
        PredatorPopulations(i) = TimeStep*(Prey1GrowthConstant(i)* (Populations(i)* Prey1Population * CompetitionTerm ) + (Prey2GrowthConstant(i) * Populations(i) * (CompetitionTerm * Prey2Population)) - PredatorMortalityRate(i)* Populations(i))
    end