0.000: (goto_waypoint robot0 wp0 printer0)  [95.000]
0.000: (goto_waypoint robot1 wp0 printer0)  [95.000]
0.000: (goto_waypoint robot2 wp0 printer0)  [95.000]
95.001: (wait_load_at_printer robot0 robot1 printer0)  [15.000]
95.001: (goto_waypoint robot2 printer0 wp3)  [545.000]
110.001: (goto_waypoint robot0 printer0 wp0)  [95.000]
110.001: (goto_waypoint robot1 printer0 wp0)  [95.000]
205.002: (goto_waypoint robot0 wp0 wp1)  [60.000]
205.002: (goto_waypoint robot1 wp0 printer0)  [95.000]
265.002: (ask_unload robot0 wp1)  [5.000]
270.003: (wait_unload robot0 wp1)  [15.000]
285.003: (goto_waypoint robot0 wp1 printer0)  [105.000]
390.003: (wait_load_at_printer robot1 robot0 printer0)  [15.000]
405.003: (goto_waypoint robot1 printer0 wp0)  [95.000]
405.003: (goto_waypoint robot0 printer0 wp6)  [330.000]
500.003: (ask_unload robot1 wp0)  [5.000]
505.004: (goto_waypoint robot1 wp0 wp6)  [235.000]
640.002: (goto_waypoint robot2 wp3 printer1)  [335.000]
735.004: (goto_waypoint robot0 wp6 printer1)  [120.000]
740.004: (ask_unload robot1 wp6)  [5.000]
745.005: (goto_waypoint robot1 wp6 wp3)  [375.000]
975.002: (wait_load_at_printer robot0 robot2 printer1)  [15.000]
990.002: (goto_waypoint robot2 printer1 wp8)  [390.000]
1120.005: (ask_unload robot1 wp3)  [5.000]
1125.006: (wait_unload robot1 wp3)  [15.000]
1140.006: (goto_waypoint robot1 wp3 printer2)  [130.000]
1270.007: (goto_waypoint robot1 printer2 printer3)  [385.000]
1355.007: (goto_waypoint robot0 printer1 wp6)  [120.000]
1380.003: (goto_waypoint robot2 wp8 printer3)  [150.000]
1475.007: (ask_unload robot0 wp6)  [5.000]
1480.008: (wait_unload robot0 wp6)  [15.000]
1495.008: (goto_waypoint robot0 wp6 printer2)  [345.000]
1655.007: (wait_load_at_printer robot2 robot1 printer3)  [15.000]
1670.007: (goto_waypoint robot2 printer3 wp8)  [150.000]
1820.007: (ask_unload robot2 wp8)  [5.000]
1825.008: (wait_unload robot2 wp8)  [15.000]
