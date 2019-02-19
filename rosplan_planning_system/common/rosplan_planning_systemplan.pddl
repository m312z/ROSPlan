Number of literals: 55
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Pruning (ask_unload robot0 wp2) - never appeared in initial RPG
Pruning (ask_unload robot1 wp2) - never appeared in initial RPG
Pruning (ask_unload robot2 wp2) - never appeared in initial RPG
Pruning (ask_unload robot0 wp3) - never appeared in initial RPG
Pruning (ask_unload robot1 wp3) - never appeared in initial RPG
Pruning (ask_unload robot2 wp3) - never appeared in initial RPG
Pruning (ask_unload robot0 wp4) - never appeared in initial RPG
Pruning (ask_unload robot1 wp4) - never appeared in initial RPG
Pruning (ask_unload robot2 wp4) - never appeared in initial RPG
Pruning (wait_unload robot0 wp2) - never appeared in initial RPG
Pruning (wait_unload robot1 wp2) - never appeared in initial RPG
Pruning (wait_unload robot2 wp2) - never appeared in initial RPG
Pruning (wait_unload robot0 wp3) - never appeared in initial RPG
Pruning (wait_unload robot1 wp3) - never appeared in initial RPG
Pruning (wait_unload robot2 wp3) - never appeared in initial RPG
Pruning (wait_unload robot0 wp4) - never appeared in initial RPG
Pruning (wait_unload robot1 wp4) - never appeared in initial RPG
Pruning (wait_unload robot2 wp4) - never appeared in initial RPG
All the ground actions in this problem are compression-safe
Initial heuristic = 5.000
b (4.000 | 90.000)b (3.000 | 105.001)b (2.000 | 195.001)b (1.000 | 200.001);;;; Solution Found
; States evaluated: 10
; Cost: 215.002
; Time 0.00
0.000: (goto_waypoint robot0 wp0 printer0)  [90.000]
0.000: (goto_waypoint robot1 wp0 printer0)  [90.000]
0.000: (goto_waypoint robot2 wp0 printer0)  [90.000]
90.001: (wait_load_at_printer robot0 robot1 printer0)  [15.000]
105.001: (goto_waypoint robot0 printer0 wp0)  [90.000]
125.002: (goto_waypoint robot1 printer0 wp0)  [90.000]
195.001: (ask_unload robot0 wp0)  [5.000]
200.002: (wait_unload robot0 wp0)  [15.000]
