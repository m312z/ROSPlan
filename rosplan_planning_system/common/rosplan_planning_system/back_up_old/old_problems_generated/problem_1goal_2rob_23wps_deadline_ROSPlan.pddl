(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    robot0 robot1 - robot
    printer0 printer1 - printer
)
(:init
    (robot_at robot0 wp2)
    (robot_at robot1 wp1)

    (undocked robot0)
    (undocked robot1)


    (localised robot0)
    (localised robot1)

    (dock_at wp0)


    (nocarrying_papers robot0)
    (nocarrying_papers robot1)



    (delivery_destination wp0)
    (delivery_destination wp1)
    (delivery_destination wp2)

    (at 1054.94 (not (delivery_destination wp0)))
    (at 1054.94 (not (delivery_destination wp1)))
    (at 1054.94 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 63)
    (= (distance wp1 wp0) 63)
    (= (distance wp0 wp2) 13)
    (= (distance wp2 wp0) 13)
    (= (distance wp0 printer0) 70)
    (= (distance printer0 wp0) 70)
    (= (distance wp0 printer1) 80)
    (= (distance printer1 wp0) 80)
    (= (distance wp1 wp2) 76)
    (= (distance wp2 wp1) 76)
    (= (distance wp1 printer0) 61)
    (= (distance printer0 wp1) 61)
    (= (distance wp1 printer1) 143)
    (= (distance printer1 wp1) 143)
    (= (distance wp2 printer0) 67)
    (= (distance printer0 wp2) 67)
    (= (distance wp2 printer1) 67)
    (= (distance printer1 wp2) 67)
    (= (distance printer0 printer1) 82)
    (= (distance printer1 printer0) 82)

)
(:goal (and
    (papers_delivered wp2)
))
)
