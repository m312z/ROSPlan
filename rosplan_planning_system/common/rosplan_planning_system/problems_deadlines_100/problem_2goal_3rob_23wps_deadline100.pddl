(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    printer0 printer1 - printer
    robot0 robot1 robot2 - robot
)
(:init
    (robot_at robot0 wp2)
    (nocarrying_papers robot0)
    (undocked robot0)
    (localised robot0)

    (robot_at robot1 wp0)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (robot_at robot2 wp1)
    (nocarrying_papers robot2)
    (undocked robot2)
    (localised robot2)

    (dock_at wp0)

    (delivery_destination wp0) (at 780.003 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 780.003 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 780.003 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 32)
    (= (distance wp1 wp0) 32)
    (= (distance wp0 wp2) 26)
    (= (distance wp2 wp0) 26)
    (= (distance wp0 printer0) 21)
    (= (distance printer0 wp0) 21)
    (= (distance wp0 printer1) 11)
    (= (distance printer1 wp0) 11)
    (= (distance wp1 wp2) 10)
    (= (distance wp2 wp1) 10)
    (= (distance wp1 printer0) 11)
    (= (distance printer0 wp1) 11)
    (= (distance wp1 printer1) 23)
    (= (distance printer1 wp1) 23)
    (= (distance wp2 printer0) 13)
    (= (distance printer0 wp2) 13)
    (= (distance wp2 printer1) 17)
    (= (distance printer1 wp2) 17)
    (= (distance printer0 printer1) 16)
    (= (distance printer1 printer0) 16)
)
(:goal (and
    (papers_delivered wp2)
    (papers_delivered wp0)
))
)
