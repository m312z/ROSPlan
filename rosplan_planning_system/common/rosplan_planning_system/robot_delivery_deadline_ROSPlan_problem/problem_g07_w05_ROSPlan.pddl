(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 wp5 - waypoint
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
    (delivery_destination wp1)
    (delivery_destination wp2)
    (delivery_destination wp3)
    (delivery_destination wp4)
    (delivery_destination wp5)

    (at 2823.09 (not (delivery_destination wp0)))
    (at 2823.09 (not (delivery_destination wp1)))
    (at 2823.09 (not (delivery_destination wp2)))
    (at 2823.09 (not (delivery_destination wp3)))
    (at 2823.09 (not (delivery_destination wp4)))
    (at 2823.09 (not (delivery_destination wp5)))

    (= (distance wp0 wp1) 39)
    (= (distance wp1 wp0) 39)
    (= (distance wp0 wp2) 94)
    (= (distance wp2 wp0) 94)
    (= (distance wp0 wp3) 104)
    (= (distance wp3 wp0) 104)
    (= (distance wp0 wp4) 88)
    (= (distance wp4 wp0) 88)
    (= (distance wp0 wp5) 35)
    (= (distance wp5 wp0) 35)
    (= (distance wp0 printer0) 83)
    (= (distance printer0 wp0) 83)
    (= (distance wp0 printer1) 99)
    (= (distance printer1 wp0) 99)
    (= (distance wp0 printer2) 119)
    (= (distance printer2 wp0) 119)
    (= (distance wp0 printer3) 27)
    (= (distance printer3 wp0) 27)
    (= (distance wp1 wp2) 101)
    (= (distance wp2 wp1) 101)
    (= (distance wp1 wp3) 111)
    (= (distance wp3 wp1) 111)
    (= (distance wp1 wp4) 95)
    (= (distance wp4 wp1) 95)
    (= (distance wp1 wp5) 68)
    (= (distance wp5 wp1) 68)
    (= (distance wp1 printer0) 90)
    (= (distance printer0 wp1) 90)
    (= (distance wp1 printer1) 106)
    (= (distance printer1 wp1) 106)
    (= (distance wp1 printer2) 126)
    (= (distance printer2 wp1) 126)
    (= (distance wp1 printer3) 34)
    (= (distance printer3 wp1) 34)
    (= (distance wp2 wp3) 28)
    (= (distance wp3 wp2) 28)
    (= (distance wp2 wp4) 6)
    (= (distance wp4 wp2) 6)
    (= (distance wp2 wp5) 73)
    (= (distance wp5 wp2) 73)
    (= (distance wp2 printer0) 11)
    (= (distance printer0 wp2) 11)
    (= (distance wp2 printer1) 75)
    (= (distance printer1 wp2) 75)
    (= (distance wp2 printer2) 35)
    (= (distance printer2 wp2) 35)
    (= (distance wp2 printer3) 67)
    (= (distance printer3 wp2) 67)
    (= (distance wp3 wp4) 24)
    (= (distance wp4 wp3) 24)
    (= (distance wp3 wp5) 101)
    (= (distance wp5 wp3) 101)
    (= (distance wp3 printer0) 35)
    (= (distance printer0 wp3) 35)
    (= (distance wp3 printer1) 103)
    (= (distance printer1 wp3) 103)
    (= (distance wp3 printer2) 63)
    (= (distance printer2 wp3) 63)
    (= (distance wp3 printer3) 77)
    (= (distance printer3 wp3) 77)
    (= (distance wp4 wp5) 77)
    (= (distance wp5 wp4) 77)
    (= (distance wp4 printer0) 11)
    (= (distance printer0 wp4) 11)
    (= (distance wp4 printer1) 79)
    (= (distance printer1 wp4) 79)
    (= (distance wp4 printer2) 39)
    (= (distance printer2 wp4) 39)
    (= (distance wp4 printer3) 61)
    (= (distance printer3 wp4) 61)
    (= (distance wp5 printer0) 66)
    (= (distance printer0 wp5) 66)
    (= (distance wp5 printer1) 64)
    (= (distance printer1 wp5) 64)
    (= (distance wp5 printer2) 84)
    (= (distance printer2 wp5) 84)
    (= (distance wp5 printer3) 56)
    (= (distance printer3 wp5) 56)
    (= (distance printer0 printer1) 68)
    (= (distance printer1 printer0) 68)
    (= (distance printer0 printer2) 36)
    (= (distance printer2 printer0) 36)
    (= (distance printer0 printer3) 56)
    (= (distance printer3 printer0) 56)
    (= (distance printer1 printer2) 40)
    (= (distance printer2 printer1) 40)
    (= (distance printer1 printer3) 72)
    (= (distance printer3 printer1) 72)
    (= (distance printer2 printer3) 92)
    (= (distance printer3 printer2) 92)

)
(:goal (and
    (papers_delivered wp4)
    (papers_delivered wp5)
    (papers_delivered wp2)
    (papers_delivered wp4)
    (papers_delivered wp4)
    (papers_delivered wp3)
    (papers_delivered wp0)
))
)
