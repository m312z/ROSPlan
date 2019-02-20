Number of literals: 46
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
All the ground actions in this problem are compression-safe
Initial heuristic = 6.000
b (5.000 | 25.000)b (4.000 | 40.001)b (2.000 | 170.001)b (1.000 | 175.001);;;; Solution Found
; States evaluated: 20
; Cost: 190.002
; Time 0.00
0.000: (goto_waypoint robot0 wp0 printer3)  [25.000]
0.000: (goto_waypoint robot1 wp0 printer3)  [25.000]
0.000: (goto_waypoint robot2 wp0 printer3)  [25.000]
25.001: (wait_load_at_printer robot0 robot1 printer3)  [15.000]
40.001: (goto_waypoint robot0 printer3 wp1)  [130.000]
40.001: (goto_waypoint robot1 printer3 wp1)  [130.000]
170.001: (ask_unload robot0 wp1)  [5.000]
175.002: (wait_unload robot0 wp1)  [15.000]
