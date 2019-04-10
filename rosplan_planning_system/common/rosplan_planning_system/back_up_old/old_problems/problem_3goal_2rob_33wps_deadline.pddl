(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 - waypoint
    printer0 printer1 printer2 - printer
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

    (delivery_destination wp0) (at 3952.506 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 3952.506 (not (delivery_destination wp1)))
    (delivery_destination wp2) (at 3952.506 (not (delivery_destination wp2)))

    (= (distance wp0 wp1) 90)
    (= (distance wp1 wp0) 90)
    (= (distance wp0 wp2) 92)
    (= (distance wp2 wp0) 92)
    (= (distance wp0 printer0) 23)
    (= (distance printer0 wp0) 23)
    (= (distance wp0 printer1) 156)
    (= (distance printer1 wp0) 156)
    (= (distance wp0 printer2) 9)
    (= (distance printer2 wp0) 9)
    (= (distance wp1 wp2) 32)
    (= (distance wp2 wp1) 32)
    (= (distance wp1 printer0) 91)
    (= (distance printer0 wp1) 91)
    (= (distance wp1 printer1) 88)
    (= (distance printer1 wp1) 88)
    (= (distance wp1 printer2) 91)
    (= (distance printer2 wp1) 91)
    (= (distance wp2 printer0) 93)
    (= (distance printer0 wp2) 93)
    (= (distance wp2 printer1) 120)
    (= (distance printer1 wp2) 120)
    (= (distance wp2 printer2) 93)
    (= (distance printer2 wp2) 93)
    (= (distance printer0 printer1) 133)
    (= (distance printer1 printer0) 133)
    (= (distance printer0 printer2) 14)
    (= (distance printer2 printer0) 14)
    (= (distance printer1 printer2) 147)
    (= (distance printer2 printer1) 147)
)
(:goal (and
    (papers_delivered wp1)
    (papers_delivered wp0)
    (papers_delivered wp2)
))
)