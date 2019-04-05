(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    printer0 printer1 - printer
    robot0 robot1 robot2 - robot
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

    (robot_at robot2 wp0)
    (nocarrying_papers robot2)
    (undocked robot2)
    (localised robot2)

    (dock_at wp0)

    (delivery_destination wp0) (at 1000.005 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 1000.005 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 1000.005 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 8)
    (= (distance wp1 wp0) 8)
    (= (distance wp0 wp2) 18)
    (= (distance wp2 wp0) 18)
    (= (distance wp0 printer0) 6)
    (= (distance printer0 wp0) 6)
    (= (distance wp0 printer1) 2)
    (= (distance printer1 wp0) 2)
    (= (distance wp1 wp2) 18)
    (= (distance wp2 wp1) 18)
    (= (distance wp1 printer0) 14)
    (= (distance printer0 wp1) 14)
    (= (distance wp1 printer1) 10)
    (= (distance printer1 wp1) 10)
    (= (distance wp2 printer0) 14)
    (= (distance printer0 wp2) 14)
    (= (distance wp2 printer1) 16)
    (= (distance printer1 wp2) 16)
    (= (distance printer0 printer1) 4)
    (= (distance printer1 printer0) 4)
)
(:goal (and
    (papers_delivered wp1)
    (papers_delivered wp2)
    (papers_delivered wp0)
))
)
