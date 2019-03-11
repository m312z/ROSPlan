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

    (delivery_destination wp0) (at 2340.006 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 2340.006 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 2340.006 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 12)
    (= (distance wp1 wp0) 12)
    (= (distance wp0 wp2) 58)
    (= (distance wp2 wp0) 58)
    (= (distance wp0 printer0) 61)
    (= (distance printer0 wp0) 61)
    (= (distance wp0 printer1) 71)
    (= (distance printer1 wp0) 71)
    (= (distance wp1 wp2) 46)
    (= (distance wp2 wp1) 46)
    (= (distance wp1 printer0) 49)
    (= (distance printer0 wp1) 49)
    (= (distance wp1 printer1) 63)
    (= (distance printer1 wp1) 63)
    (= (distance wp2 printer0) 85)
    (= (distance printer0 wp2) 85)
    (= (distance wp2 printer1) 25)
    (= (distance printer1 wp2) 25)
    (= (distance printer0 printer1) 110)
    (= (distance printer1 printer0) 110)
)
(:goal (and
    (papers_delivered wp1)
    (papers_delivered wp2)
    (papers_delivered wp0)
))
)
