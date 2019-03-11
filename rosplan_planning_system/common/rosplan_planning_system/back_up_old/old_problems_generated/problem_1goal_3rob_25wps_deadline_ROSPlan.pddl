(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 - waypoint
    robot0 robot1 robot2 - robot
    printer0 printer1 - printer
)
(:init
    (robot_at robot0 printer1)
    (robot_at robot1 wp0)
    (robot_at robot2 wp3)

    (undocked robot0)
    (undocked robot1)
    (undocked robot2)


