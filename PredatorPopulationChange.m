function [PredatorPopulations] = PredatorPopulationChange(Populations, ...
                                                          TimeStep, ...
                                                          Prey1GrowthConstant,...
                                                          Prey2GrowthConstant,...
                                                          PredatorMortalityRate, ...
                                                          Prey1Population, ...
                                                          Prey2Population, ...
                                                          PredatorCompetitionCoefficients)
    PredatorPopulations = zeros(length(Populations),1);
    for i = 1:length(Populations)
        TotalPredation = 0.0;
        CompetingPredatorsSum = 0.0;
        for j = 1: length(Populations)
            if j ~= i
                CompetingPredatorsSum = CompetingPredatorsSum + Populations(j) * (1-PredatorCompetitionCoefficients(j));
            end
            if j == i
                TotalPredation = TotalPredation + Populations(j) * (1 - PredatorCompetitionCoefficients(j));
            end
        end
        TotalPredation = TotalPredation + CompetingPredatorsSum;
        CompetitionTerm = CompetingPredatorsSum/TotalPredation;
        if isnan(CompetitionTerm)
            CompetitionTerm = 1;
        end
        PredatorPopulations(i) = TimeStep*(Prey1GrowthConstant(i)* (Populations(i)* Prey1Population * CompetitionTerm ) + (Prey2GrowthConstant(i) * Populations(i) * (CompetitionTerm * Prey2Population)) - PredatorMortalityRate(i)* Populations(i));
    end
    return
end

