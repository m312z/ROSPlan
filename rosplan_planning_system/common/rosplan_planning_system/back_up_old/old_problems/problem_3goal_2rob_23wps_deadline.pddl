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

    (delivery_destination wp0) (at 2325.006 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 2325.006 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 2325.006 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 14)
    (= (distance wp1 wp0) 14)
    (= (distance wp0 wp2) 31)
    (= (distance wp2 wp0) 31)
    (= (distance wp0 printer0) 58)
    (= (distance printer0 wp0) 58)
    (= (distance wp0 printer1) 145)
    (= (distance printer1 wp0) 145)
    (= (distance wp1 wp2) 17)
    (= (distance wp2 wp1) 17)
    (= (distance wp1 printer0) 44)
    (= (distance printer0 wp1) 44)
    (= (distance wp1 printer1) 131)
    (= (distance printer1 wp1) 131)
    (= (distance wp2 printer0) 27)
    (= (distance printer0 wp2) 27)
    (= (distance wp2 printer1) 114)
    (= (distance printer1 wp2) 114)
    (= (distance printer0 printer1) 87)
    (= (distance printer1 printer0) 87)
)
(:goal (and
    (papers_delivered wp0)
    (papers_delivered wp1)
    (papers_delivered wp2)
))
)
