(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 - waypoint
    robot0 robot1 robot2 - robot
    printer0 printer1 printer2 printer3 - printer
)
(:init
    (robot_at robot0 wp0)
    (robot_at robot1 wp0)
    (robot_at robot2 wp0)

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
    (at 245.0 (not (delivery_destination wp0)))
    (delivery_destination wp1)
    (at 245.0 (not (delivery_destination wp1)))
    (delivery_destination wp2)
    (at 245.0 (not (delivery_destination wp2)))
    (delivery_destination wp3)
    (at 245.0 (not (delivery_destination wp3)))
    (delivery_destination wp4)
    (at 245.0 (not (delivery_destination wp4)))

    (= (distance wp0 wp1) 33)
    (= (distance wp1 wp0) 33)
    (= (distance wp0 wp2) 62)
    (= (distance wp2 wp0) 62)
    (= (distance wp0 wp3) 84)
    (= (distance wp3 wp0) 84)
    (= (distance wp0 wp4) 66)
    (= (distance wp4 wp0) 66)
    (= (distance wp0 printer0) 18)
    (= (distance printer0 wp0) 18)
    (= (distance wp0 printer1) 77)
    (= (distance printer1 wp0) 77)
    (= (distance wp0 printer2) 76)
    (= (distance printer2 wp0) 76)
    (= (distance wp0 printer3) 51)
    (= (distance printer3 wp0) 51)
    (= (distance wp1 wp2) 29)
    (= (distance wp2 wp1) 29)
    (= (distance wp1 wp3) 61)
    (= (distance wp3 wp1) 61)
    (= (distance wp1 wp4) 33)
    (= (distance wp4 wp1) 33)
    (= (distance wp1 printer0) 41)
    (= (distance printer0 wp1) 41)
    (= (distance wp1 printer1) 44)
    (= (distance printer1 wp1) 44)
    (= (distance wp1 printer2) 53)
    (= (distance printer2 wp1) 53)
    (= (distance wp1 printer3) 74)
    (= (distance printer3 wp1) 74)
    (= (distance wp2 wp3) 78)
    (= (distance wp3 wp2) 78)
    (= (distance wp2 wp4) 38)
    (= (distance wp4 wp2) 38)
    (= (distance wp2 printer0) 52)
    (= (distance printer0 wp2) 52)
    (= (distance wp2 printer1) 37)
    (= (distance printer1 wp2) 37)
    (= (distance wp2 printer2) 42)
    (= (distance printer2 wp2) 42)
    (= (distance wp2 printer3) 85)
    (= (distance printer3 wp2) 85)
    (= (distance wp3 wp4) 88)
    (= (distance wp4 wp3) 88)
    (= (distance wp3 printer0) 102)
    (= (distance printer0 wp3) 102)
    (= (distance wp3 printer1) 93)
    (= (distance printer1 wp3) 93)
    (= (distance wp3 printer2) 52)
    (= (distance printer2 wp3) 52)
    (= (distance wp3 printer3) 135)
    (= (distance printer3 wp3) 135)
    (= (distance wp4 printer0) 50)
    (= (distance printer0 wp4) 50)
    (= (distance wp4 printer1) 11)
    (= (distance printer1 wp4) 11)
    (= (distance wp4 printer2) 80)
    (= (distance printer2 wp4) 80)
    (= (distance wp4 printer3) 47)
    (= (distance printer3 wp4) 47)
    (= (distance printer0 printer1) 61)
    (= (distance printer1 printer0) 61)
    (= (distance printer0 printer2) 94)
    (= (distance printer2 printer0) 94)
    (= (distance printer0 printer3) 33)
    (= (distance printer3 printer0) 33)
    (= (distance printer1 printer2) 79)
    (= (distance printer2 printer1) 79)
    (= (distance printer1 printer3) 48)
    (= (distance printer3 printer1) 48)
    (= (distance printer2 printer3) 127)
    (= (distance printer3 printer2) 127)

)
(:goal (and
    (papers_delivered wp0)
))
)
