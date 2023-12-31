transformedPopulationprey1 = (abs(fft(TimeEvolvedPopulations(1,:))));
transformedPopulationprey2 = abs(fft(TimeEvolvedPopulations(2,:)));
transformedPopulationpredator1 = abs(fft(TimeEvolvedPopulations(3,1:998)));
transformedPopulationpredator2 = abs(fft(TimeEvolvedPopulations(4,1:998)));
figure
subplot(2,2,1)
plot(transformedPopulationprey1)
title("Fourier transform of sheep population")
xlabel("Frequency(Hz)")
ylabel("|F~x|")
subplot(2,2,2)
plot(transformedPopulationprey2)
title("Fourier transform of rabbit population")
xlabel("Frequency(Hz)")
ylabel("|F~x|")

subplot(2,2,3)
plot(transformedPopulationpredator1)
title("Fourier transform of fox population")
xlabel("Frequency(Hz)")
ylabel("|F~x|")

subplot(2,2,4)
plot(transformedPopulationpredator2)
title("Fourier transform of wolf population")
xlabel("Frequency(Hz)")
ylabel("|F~x|")
