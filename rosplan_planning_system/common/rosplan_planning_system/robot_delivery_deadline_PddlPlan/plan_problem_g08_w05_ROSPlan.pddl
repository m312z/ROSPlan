0.000: (goto_waypoint robot1 wp0 wp3)  [330.000]
0.000: (goto_waypoint robot0 wp0 wp4)  [340.000]
0.000: (goto_waypoint robot2 wp0 printer0)  [390.000]
330.001: (goto_waypoint robot1 wp3 printer0)  [60.000]
340.001: (goto_waypoint robot0 wp4 printer2)  [235.000]
390.001: (wait_load_at_printer robot2 robot1 printer0)  [15.000]
405.001: (goto_waypoint robot2 printer0 wp2)  [115.000]
405.001: (goto_waypoint robot1 printer0 wp1)  [325.000]
520.001: (ask_unload robot2 wp2)  [5.000]
525.002: (wait_unload robot2 wp2)  [15.000]
540.002: (goto_waypoint robot2 wp2 printer3)  [55.000]
575.002: (goto_waypoint robot0 printer2 wp2)  [110.000]
685.003: (goto_waypoint robot0 wp2 printer3)  [55.000]
730.002: (goto_waypoint robot1 wp1 wp4)  [305.000]
740.003: (wait_load_at_printer robot2 robot0 printer3)  [15.000]
755.003: (goto_waypoint robot2 printer3 wp5)  [215.000]
755.003: (goto_waypoint robot0 printer3 wp4)  [300.000]
970.003: (ask_unload robot2 wp5)  [5.000]
975.004: (wait_unload robot2 wp5)  [15.000]
990.004: (goto_waypoint robot2 wp5 printer1)  [70.000]
1035.003: (goto_waypoint robot1 wp4 printer1)  [155.000]
1055.004: (goto_waypoint robot0 wp4 wp1)  [305.000]
1190.003: (wait_load_at_printer robot2 robot1 printer1)  [15.000]
1205.003: (goto_waypoint robot2 printer1 wp5)  [70.000]
1205.003: (goto_waypoint robot1 printer1 wp1)  [150.000]
1275.003: (ask_unload robot2 wp5)  [5.000]
1280.004: (goto_waypoint robot2 wp5 wp1)  [190.000]
1355.004: (goto_waypoint robot1 wp1 wp4)  [305.000]
1360.005: (goto_waypoint robot0 wp1 wp3)  [295.000]
1470.004: (ask_unload robot2 wp1)  [5.000]
1475.005: (wait_unload robot2 wp1)  [15.000]
1490.005: (goto_waypoint robot2 wp1 printer3)  [215.000]
1655.006: (goto_waypoint robot0 wp3 printer3)  [120.000]
1660.005: (goto_waypoint robot1 wp4 printer2)  [235.000]
1775.006: (wait_load_at_printer robot2 robot0 printer3)  [15.000]
1790.006: (goto_waypoint robot0 printer3 printer2)  [65.000]
1895.005: (wait_load_at_printer robot0 robot1 printer2)  [15.000]
1910.005: (goto_waypoint robot0 printer2 wp4)  [235.000]
2025.005: (goto_waypoint robot2 printer3 wp3)  [120.000]
2100.006: (goto_waypoint robot1 printer2 printer3)  [65.000]
2145.005: (ask_unload robot2 wp3)  [5.000]
2145.005: (ask_unload robot0 wp4)  [5.000]
2150.006: (wait_unload robot2 wp3)  [15.000]
2150.006: (wait_unload robot0 wp4)  [15.000]
