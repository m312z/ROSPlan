0.000: (goto_waypoint robot0 wp0 printer2)  [30.000]
0.000: (goto_waypoint robot1 wp0 printer2)  [30.000]
0.000: (goto_waypoint robot2 wp0 printer2)  [30.000]
30.001: (goto_waypoint robot2 printer2 wp2)  [290.000]
30.001: (wait_load_at_printer robot0 robot1 printer2)  [15.000]
45.001: (goto_waypoint robot0 printer2 wp0)  [30.000]
45.001: (goto_waypoint robot1 printer2 wp0)  [30.000]
75.001: (ask_unload robot0 wp0)  [5.000]
75.002: (goto_waypoint robot1 wp0 printer2)  [30.000]
80.002: (wait_unload robot0 wp0)  [15.000]
95.002: (goto_waypoint robot0 wp0 printer2)  [30.000]
125.002: (wait_load_at_printer robot1 robot0 printer2)  [15.000]
140.002: (goto_waypoint robot1 printer2 wp1)  [120.000]
140.002: (goto_waypoint robot0 printer2 printer1)  [140.000]
260.002: (ask_unload robot1 wp1)  [5.000]
265.003: (goto_waypoint robot1 wp1 wp3)  [280.000]
280.003: (goto_waypoint robot0 printer1 wp1)  [110.000]
320.002: (goto_waypoint robot2 wp2 printer1)  [150.000]
390.004: (goto_waypoint robot0 wp1 printer1)  [110.000]
500.004: (wait_load_at_printer robot2 robot0 printer1)  [15.000]
515.004: (goto_waypoint robot2 printer1 wp1)  [110.000]
545.003: (ask_unload robot1 wp3)  [5.000]
550.004: (wait_unload robot1 wp3)  [15.000]
565.004: (goto_waypoint robot1 wp3 printer2)  [160.000]
625.004: (ask_unload robot2 wp1)  [5.000]
630.005: (wait_unload robot2 wp1)  [15.000]
645.005: (goto_waypoint robot2 wp1 printer2)  [120.000]
660.005: (goto_waypoint robot0 printer1 printer2)  [140.000]
765.005: (wait_load_at_printer robot1 robot2 printer2)  [15.000]
780.005: (goto_waypoint robot1 printer2 wp2)  [290.000]
800.006: (goto_waypoint robot0 printer2 wp2)  [290.000]
1070.005: (ask_unload robot1 wp2)  [5.000]
1075.006: (wait_unload robot1 wp2)  [15.000]
