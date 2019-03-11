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

    (robot_at robot1 wp1)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (robot_at robot2 wp0)
    (nocarrying_papers robot2)
    (undocked robot2)
    (localised robot2)

    (dock_at wp0)

    (delivery_destination wp0) (at 1147.503 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 1147.503 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 1147.503 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 86)
    (= (distance wp1 wp0) 86)
    (= (distance wp0 wp2) 50)
    (= (distance wp2 wp0) 50)
    (= (distance wp0 printer0) 68)
    (= (distance printer0 wp0) 68)
    (= (distance wp0 printer1) 63)
    (= (distance printer1 wp0) 63)
    (= (distance wp1 wp2) 38)
    (= (distance wp2 wp1) 38)
    (= (distance wp1 printer0) 62)
    (= (distance printer0 wp1) 62)
    (= (distance wp1 printer1) 47)
    (= (distance printer1 wp1) 47)
    (= (distance wp2 printer0) 58)
    (= (distance printer0 wp2) 58)
    (= (distance wp2 printer1) 13)
    (= (distance printer1 wp2) 13)
    (= (distance printer0 printer1) 71)
    (= (distance printer1 printer0) 71)
)
(:goal (and
    (papers_delivered wp2)
    (papers_delivered wp1)
))
)
