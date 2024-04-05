# General model for the specific Bipartite Matching Problem

set employees;
set programs;
set preferences within {employees cross programs};

param interest {(u,v) in preferences} >= 0;

var matching {(u,v) in preferences} >= 0;

maximize happiness:
sum {(u,v) in preferences} interest[u,v]*matching[u,v];

subject to employee_constraints {i in employees}:
sum {j in programs} matching[i,j] = 1;

subject to program_constraints {j in programs}:
sum {i in employees} matching[i,j] = 1;
