Number of literals: 28
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
All the ground actions in this problem are compression-safe
Initial heuristic = 6.000
b (4.000 | 90.000)b (2.000 | 340.001)b (1.000 | 360.001);;;; Solution Found
; States evaluated: 13
; Cost: 420.002
; Time 0.00
0.000: (goto_waypoint robot1 wp0 printer0)  [90.000]
0.000: (goto_waypoint robot0 wp1 printer0)  [140.000]
140.001: (wait_load_at_printer robot1 robot0 printer0)  [60.000]
200.001: (goto_waypoint robot1 printer0 wp1)  [140.000]
340.001: (ask_unload robot1 wp1)  [20.000]
360.002: (wait_unload robot1 wp1)  [60.000]
