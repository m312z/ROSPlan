Number of literals: 50
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
All the ground actions in this problem are compression-safe
Initial heuristic = 13.000
b (11.000 | 275.000)b (10.000 | 515.001)b (9.000 | 530.001)b (8.000 | 1165.001)b (7.000 | 1165.001)b (6.000 | 1770.003)b (5.000 | 1770.003)b (4.000 | 2175.004)b (3.000 | 2180.004)b (2.000 | 2660.004)b (1.000 | 2665.004);;;; Solution Found
; States evaluated: 697
; Cost: 2680.005
; Time 0.48
0.000: (goto_waypoint robot0 wp0 wp1)  [275.000]
0.000: (goto_waypoint robot1 wp0 wp1)  [275.000]
0.000: (goto_waypoint robot2 wp0 printer1)  [35.000]
275.001: (goto_waypoint robot0 wp1 printer1)  [240.000]
275.001: (goto_waypoint robot1 wp1 printer1)  [240.000]
515.001: (wait_load_at_printer robot2 robot0 printer1)  [15.000]
515.002: (goto_waypoint robot1 printer1 wp4)  [635.000]
530.001: (goto_waypoint robot2 printer1 wp0)  [35.000]
530.001: (goto_waypoint robot0 printer1 wp4)  [635.000]
565.001: (ask_unload robot2 wp0)  [5.000]
570.002: (wait_unload robot2 wp0)  [15.000]
585.002: (goto_waypoint robot2 wp0 printer2)  [525.000]
1150.003: (goto_waypoint robot1 wp4 printer2)  [145.000]
1165.002: (goto_waypoint robot0 wp4 wp1)  [455.000]
1295.003: (wait_load_at_printer robot2 robot1 printer2)  [15.000]
1310.003: (goto_waypoint robot2 printer2 wp2)  [50.000]
1310.003: (goto_waypoint robot1 printer2 wp1)  [460.000]
1360.003: (ask_unload robot2 wp2)  [5.000]
1365.004: (wait_unload robot2 wp2)  [15.000]
1380.004: (goto_waypoint robot2 wp2 printer1)  [540.000]
1620.003: (goto_waypoint robot0 wp1 printer1)  [240.000]
1770.004: (goto_waypoint robot1 wp1 printer1)  [240.000]
1920.004: (wait_load_at_printer robot0 robot2 printer1)  [15.000]
1935.004: (goto_waypoint robot0 printer1 wp1)  [240.000]
1935.004: (goto_waypoint robot2 printer1 wp0)  [35.000]
1970.005: (goto_waypoint robot2 wp0 printer1)  [35.000]
2010.004: (wait_load_at_printer robot2 robot1 printer1)  [15.000]
2025.004: (goto_waypoint robot2 printer1 wp4)  [635.000]
2175.004: (ask_unload robot0 wp1)  [5.000]
2180.005: (wait_unload robot0 wp1)  [15.000]
2195.005: (goto_waypoint robot0 wp1 wp4)  [455.000]
2660.004: (ask_unload robot2 wp4)  [5.000]
2665.005: (wait_unload robot2 wp4)  [15.000]
