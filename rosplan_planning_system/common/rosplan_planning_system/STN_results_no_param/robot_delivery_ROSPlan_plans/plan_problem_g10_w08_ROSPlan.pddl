0.000: (goto_waypoint robot0 wp0 printer1)  [25.000]
0.000: (goto_waypoint robot1 wp0 printer1)  [25.000]
0.000: (goto_waypoint robot2 wp0 printer1)  [25.000]
25.001: (goto_waypoint robot2 printer1 wp2)  [540.000]
25.001: (wait_load_at_printer robot0 robot1 printer1)  [15.000]
40.001: (goto_waypoint robot0 printer1 wp0)  [25.000]
40.001: (goto_waypoint robot1 printer1 wp0)  [25.000]
65.001: (ask_unload robot0 wp0)  [5.000]
65.002: (goto_waypoint robot1 wp0 printer1)  [25.000]
70.002: (wait_unload robot0 wp0)  [15.000]
85.002: (goto_waypoint robot0 wp0 printer1)  [25.000]
110.002: (wait_load_at_printer robot1 robot0 printer1)  [15.000]
125.002: (goto_waypoint robot1 printer1 wp0)  [25.000]
125.002: (goto_waypoint robot0 printer1 wp2)  [540.000]
150.002: (ask_unload robot1 wp0)  [5.000]
155.003: (goto_waypoint robot1 wp0 wp4)  [380.000]
535.003: (ask_unload robot1 wp4)  [5.000]
540.004: (wait_unload robot1 wp4)  [15.000]
555.004: (goto_waypoint robot1 wp4 printer2)  [150.000]
565.002: (goto_waypoint robot2 wp2 printer2)  [135.000]
665.003: (goto_waypoint robot0 wp2 wp1)  [130.000]
705.004: (wait_load_at_printer robot2 robot1 printer2)  [15.000]
720.004: (goto_waypoint robot2 printer2 wp5)  [80.000]
720.004: (goto_waypoint robot1 printer2 wp2)  [135.000]
795.004: (goto_waypoint robot0 wp1 printer2)  [195.000]
800.004: (ask_unload robot2 wp5)  [5.000]
805.005: (wait_unload robot2 wp5)  [15.000]
820.005: (goto_waypoint robot2 wp5 printer2)  [80.000]
855.005: (goto_waypoint robot1 wp2 wp7)  [465.000]
990.004: (wait_load_at_printer robot2 robot0 printer2)  [15.000]
1005.004: (goto_waypoint robot2 printer2 wp3)  [275.000]
1005.004: (goto_waypoint robot0 printer2 printer3)  [280.000]
1280.004: (ask_unload robot2 wp3)  [5.000]
1285.005: (wait_unload robot2 wp3)  [15.000]
1300.005: (goto_waypoint robot2 wp3 printer3)  [35.000]
1320.006: (goto_waypoint robot1 wp7 printer0)  [50.000]
1335.005: (wait_load_at_printer robot0 robot2 printer3)  [15.000]
1350.005: (goto_waypoint robot0 printer3 wp7)  [60.000]
1350.005: (goto_waypoint robot2 printer3 wp7)  [60.000]
1410.005: (ask_unload robot0 wp7)  [5.000]
1410.006: (goto_waypoint robot2 wp7 printer0)  [50.000]
1415.006: (goto_waypoint robot0 wp7 wp6)  [445.000]
1460.006: (wait_load_at_printer robot1 robot2 printer0)  [15.000]
1475.006: (goto_waypoint robot1 printer0 wp7)  [50.000]
1475.006: (goto_waypoint robot2 printer0 wp2)  [515.000]
1525.006: (ask_unload robot1 wp7)  [5.000]
1530.007: (wait_unload robot1 wp7)  [15.000]
1545.007: (goto_waypoint robot1 wp7 printer1)  [535.000]
1860.006: (ask_unload robot0 wp6)  [5.000]
1865.007: (wait_unload robot0 wp6)  [15.000]
1880.007: (goto_waypoint robot0 wp6 printer2)  [315.000]
1990.007: (goto_waypoint robot2 wp2 printer2)  [135.000]
2195.007: (wait_load_at_printer robot2 robot0 printer2)  [15.000]
2210.007: (goto_waypoint robot2 printer2 wp2)  [135.000]
2345.007: (ask_unload robot2 wp2)  [5.000]
2350.008: (wait_unload robot2 wp2)  [15.000]