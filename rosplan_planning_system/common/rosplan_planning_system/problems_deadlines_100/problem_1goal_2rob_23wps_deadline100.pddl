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

    (delivery_destination wp0) (at 420.002 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 420.002 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 420.002 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 21)
    (= (distance wp1 wp0) 21)
    (= (distance wp0 wp2) 8)
    (= (distance wp2 wp0) 8)
    (= (distance wp0 printer0) 9)
    (= (distance printer0 wp0) 9)
    (= (distance wp0 printer1) 4)
    (= (distance printer1 wp0) 4)
    (= (distance wp1 wp2) 13)
    (= (distance wp2 wp1) 13)
    (= (distance wp1 printer0) 14)
    (= (distance printer0 wp1) 14)
    (= (distance wp1 printer1) 17)
    (= (distance printer1 wp1) 17)
    (= (distance wp2 printer0) 3)
    (= (distance printer0 wp2) 3)
    (= (distance wp2 printer1) 6)
    (= (distance printer1 wp2) 6)
    (= (distance printer0 printer1) 9)
    (= (distance printer1 printer0) 9)
)
(:goal (and
    (papers_delivered wp1)
))
)
