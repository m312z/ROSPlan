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

    (robot_at robot1 wp0)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (dock_at wp0)

    (delivery_destination wp0) (at 1100.004 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 1100.004 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 1100.004 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 17)
    (= (distance wp1 wp0) 17)
    (= (distance wp0 wp2) 3)
    (= (distance wp2 wp0) 3)
    (= (distance wp0 printer0) 6)
    (= (distance printer0 wp0) 6)
    (= (distance wp0 printer1) 22)
    (= (distance printer1 wp0) 22)
    (= (distance wp1 wp2) 20)
    (= (distance wp2 wp1) 20)
    (= (distance wp1 printer0) 17)
    (= (distance printer0 wp1) 17)
    (= (distance wp1 printer1) 31)
    (= (distance printer1 wp1) 31)
    (= (distance wp2 printer0) 5)
    (= (distance printer0 wp2) 5)
    (= (distance wp2 printer1) 21)
    (= (distance printer1 wp2) 21)
    (= (distance printer0 printer1) 16)
    (= (distance printer1 printer0) 16)
)
(:goal (and
    (papers_delivered wp1)
    (papers_delivered wp0)
    (papers_delivered wp2)
))
)
