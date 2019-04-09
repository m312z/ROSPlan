(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    printer0 printer1 - printer
    robot0 robot1 - robot
)
(:init
    (robot_at robot0 wp1)
    (nocarrying_papers robot0)
    (undocked robot0)
    (localised robot0)

    (robot_at robot1 wp2)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (dock_at wp0)

    (delivery_destination wp0) (at 620.003 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 620.003 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 620.003 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 18)
    (= (distance wp1 wp0) 18)
    (= (distance wp0 wp2) 11)
    (= (distance wp2 wp0) 11)
    (= (distance wp0 printer0) 13)
    (= (distance printer0 wp0) 13)
    (= (distance wp0 printer1) 21)
    (= (distance printer1 wp0) 21)
    (= (distance wp1 wp2) 13)
    (= (distance wp2 wp1) 13)
    (= (distance wp1 printer0) 15)
    (= (distance printer0 wp1) 15)
    (= (distance wp1 printer1) 7)
    (= (distance printer1 wp1) 7)
    (= (distance wp2 printer0) 2)
    (= (distance printer0 wp2) 2)
    (= (distance wp2 printer1) 10)
    (= (distance printer1 wp2) 10)
    (= (distance printer0 printer1) 12)
    (= (distance printer1 printer0) 12)
)
(:goal (and
    (papers_delivered wp1)
    (papers_delivered wp2)
))
)
