(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 - waypoint
    robot0 robot1 - robot
    printer0 printer1 - printer
)
(:init
    (robot_at robot1 printer0)
    (robot_at robot0 wp3)

    (undocked robot0)
    (undocked robot1)


    (localised robot0)
    (localised robot1)

    (dock_at wp0)


    (nocarrying_papers robot1)

    (asked_unload robot0)


    (delivery_destination wp0)
    (delivery_destination wp1)
    (delivery_destination wp2)
    (delivery_destination wp3)

    (at 1467.86 (not (delivery_destination wp0)))
    (at 1467.86 (not (delivery_destination wp1)))
    (at 1467.86 (not (delivery_destination wp2)))
    (at 1467.86 (not (delivery_destination wp3)))

    (= (distance wp0 wp1) 79)
    (= (distance wp1 wp0) 79)
    (= (distance wp0 wp2) 118)
    (= (distance wp2 wp0) 118)
    (= (distance wp0 wp3) 36)
    (= (distance wp3 wp0) 36)
    (= (distance wp0 printer0) 117)
    (= (distance printer0 wp0) 117)
    (= (distance wp0 printer1) 24)
    (= (distance printer1 wp0) 24)
    (= (distance wp1 wp2) 85)
    (= (distance wp2 wp1) 85)
    (= (distance wp1 wp3) 49)
    (= (distance wp3 wp1) 49)
    (= (distance wp1 printer0) 102)
    (= (distance printer0 wp1) 102)
    (= (distance wp1 printer1) 59)
    (= (distance printer1 wp1) 59)
    (= (distance wp2 wp3) 98)
    (= (distance wp3 wp2) 98)
    (= (distance wp2 printer0) 17)
    (= (distance printer0 wp2) 17)
    (= (distance wp2 printer1) 108)
    (= (distance printer1 wp2) 108)
    (= (distance wp3 printer0) 97)
    (= (distance printer0 wp3) 97)
    (= (distance wp3 printer1) 12)
    (= (distance printer1 wp3) 12)
    (= (distance printer0 printer1) 107)
    (= (distance printer1 printer0) 107)

)
(:goal (and
    (papers_delivered wp3)
))
)
