Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
88% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000
b (7.000 | 60.000)b (6.000 | 80.000)b (5.000 | 140.000)b (4.000 | 160.000)b (3.000 | 240.001)b (2.000 | 260.001);;;; Solution Found
; States evaluated: 15
; Cost: 320.001
; Time 0.00
0.000: (collect_order r0 s0 o0)  [60.000]
60.000: (goto_waypoint r0 s0 bs0)  [20.000]
80.000: (produce_base r0 bs0 o0)  [60.000]
140.000: (goto_waypoint r0 bs0 ow0)  [20.000]
160.001: (goto_waypoint r0 ow0 rs0)  [20.000]
180.001: (stack_ring r0 rs0 o0)  [60.000]
240.001: (goto_waypoint r0 rs0 ow0)  [20.000]
260.001: (deliver_order r0 ow0 o0)  [60.000]
