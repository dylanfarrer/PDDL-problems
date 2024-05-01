# PDDL-problems

This repository defines the domain and problem for several scenarios in PDDL, that can then be solved by fast-downard (https://www.fast-downward.org/HomePage)

PDDL scenarios:
- Robotic Explorer (rover-pddl)
- White-Black Puzzle (wb-pddl)
- Warehouse Domain (ware-pddl)

Additonal commentary in each pddl file

To run a scenario:
```
Download fast-downward and build it

./fast-downward.py <domain-file>.pddl <problem-file>.pddl --search "astar(goalcount())"
```