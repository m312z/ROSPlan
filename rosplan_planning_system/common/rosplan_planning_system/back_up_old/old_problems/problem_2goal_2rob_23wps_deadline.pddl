(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    printer0 printer1 - printer
    robot0 robot1 - robot
)
(:init
    (robot_at robot0 wp0)
    (nocarrying_papers robot0)
    (undocked robot0)
    (localised robot0)

    (robot_at robot1 wp1)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (dock_at wp0)

    (delivery_destination wp0) (at 2085.006 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 2085.006 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 2085.006 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 65)
    (= (distance wp1 wp0) 65)
    (= (distance wp0 wp2) 34)
    (= (distance wp2 wp0) 34)
    (= (distance wp0 printer0) 41)
    (= (distance printer0 wp0) 41)
    (= (distance wp0 printer1) 51)
    (= (distance printer1 wp0) 51)
    (= (distance wp1 wp2) 99)
    (= (distance wp2 wp1) 99)
    (= (distance wp1 printer0) 54)
    (= (distance printer0 wp1) 54)
    (= (distance wp1 printer1) 72)
    (= (distance printer1 wp1) 72)
    (= (distance wp2 printer0) 75)
    (= (distance printer0 wp2) 75)
    (= (distance wp2 printer1) 85)
    (= (distance printer1 wp2) 85)
    (= (distance printer0 printer1) 18)
    (= (distance printer1 printer0) 18)
)
(:goal (and
    (papers_delivered wp0)
    (papers_delivered wp1)
))
)
