0.000: (goto_waypoint robot0 wp0 printer3)  [185.000]
0.000: (goto_waypoint robot1 wp0 printer3)  [185.000]
185.001: (wait_load_at_printer robot0 robot1 printer3)  [15.000]
200.001: (goto_waypoint robot0 printer3 wp3)  [420.000]
220.002: (goto_waypoint robot1 printer3 wp3)  [420.000]
620.001: (ask_unload robot0 wp3)  [5.000]
625.002: (wait_unload robot0 wp3)  [15.000]
