# General Model for Network Flow
set way_points;
set crossroads within way_points;
set grid within way_points;
set path_ways within {way_points cross way_points};

param cost {(u,v) in path_ways} >=0;

var flow {(u,v) in path_ways} >=0;

minimize shortestpath: 
sum {(u,v) in path_ways} cost[u,v]*flow[u,v];

subject to balance {r in crossroads}:
sum {(u,r) in path_ways} flow[u,r] - sum {(r,v) in path_ways} flow[r,v];

subject to capacity {(u,v) in path_ways}: 
flow[u,v]<=1;

subject to regulate_flow {j in grid}:
sum {(u,j) in path_ways} flow[u,j] = 1;