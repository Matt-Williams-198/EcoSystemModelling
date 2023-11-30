function P = odefunc3Type1(t,y,r1,r2,K1,K2,a,b,e1,e2,g,s1,s2)
% Rosenzweig-MacArthur equations for 2 competing prey and 1 predator
% population with Holling type 1 (linear) functional responses.
% These are NOT non-dimensionalised.

% Input variables:
% t - time
% y(i) - population i
% r1 - growth rate of prey 1, r2 - growth rate of prey 2
% K1 - carrying capacity of prey 1, K2 - carrying capacity of prey 2
% a - competition of prey 2 on 1, b - competition of prey 1 on 2
% e1 - growth of predator per prey 1 eaten
% e2 - growth of predator per prey 2 eaten
% g - natural death of predator
% s1 - attack rate on prey 1, s2 - attack rate on prey 2

% Output variables:
% P(i) - rate of change of population i

P = zeros(3,1);

P(1) = r1*y(1)*(1-(y(1)+a*y(2))/K1) - s1*y(1)*y(3);
P(2) = r2*y(2)*(1-(y(2)+b*y(1))/K2) - s2*y(2)*y(3);
P(3) = e1*s1*y(1)*y(3) + e2*s2*y(2)*y(3) - g*y(3); % Need a dirac delta type function here for farmers removing predators periodically

end

