# General model for the specific Transportation Problem

set power_plants;
set cities;

param transportation_cost {i in cities, j in power_plants};
param power_need {i in cities}
param power_supply {j in power plants}

var transportation {i in cities, j in power_plants} >= 0;

minimize cost: 
sum {i in cities, j in power_plants} transportation[i,j]*transportation_cost[i,j];

subject to supply_constraints {j in power_plant}:
sum {i in cities} transportation[i,j] = power_supply[j];

subject to supply_constraints {i in cities}:
sum {j in power_plants} transportation[i,j] = power_need[i];