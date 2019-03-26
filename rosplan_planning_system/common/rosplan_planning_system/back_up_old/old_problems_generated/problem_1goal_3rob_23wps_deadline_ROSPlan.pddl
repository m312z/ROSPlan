(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    robot0 robot1 robot2 - robot
    printer0 printer1 - printer
)
(:init
    (robot_at robot0 wp0)
    (robot_at robot1 wp1)
    (robot_at robot2 wp2)

    (undocked robot0)
    (undocked robot1)
    (undocked robot2)


    (localised robot0)
    (localised robot1)
    (localised robot2)

    (dock_at wp0)


    (nocarrying_papers robot0)
    (nocarrying_papers robot1)
    (nocarrying_papers robot2)



    (delivery_destination wp0)
    (delivery_destination wp1)
    (delivery_destination wp2)

    (at 1356.12 (not (delivery_destination wp0)))
    (at 1356.12 (not (delivery_destination wp1)))
    (at 1356.12 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 88)
    (= (distance wp1 wp0) 88)
    (= (distance wp0 wp2) 108)
    (= (distance wp2 wp0) 108)
    (= (distance wp0 printer0) 87)
    (= (distance printer0 wp0) 87)
    (= (distance wp0 printer1) 93)
    (= (distance printer1 wp0) 93)
    (= (distance wp1 wp2) 32)
    (= (distance wp2 wp1) 32)
    (= (distance wp1 printer0) 67)
    (= (distance printer0 wp1) 67)
    (= (distance wp1 printer1) 73)
    (= (distance printer1 wp1) 73)
    (= (distance wp2 printer0) 63)
    (= (distance printer0 wp2) 63)
    (= (distance wp2 printer1) 67)
    (= (distance printer1 wp2) 67)
    (= (distance printer0 printer1) 6)
    (= (distance printer1 printer0) 6)

)
(:goal (and
    (papers_delivered wp0)
))
)
