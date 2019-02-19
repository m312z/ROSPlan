(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 - waypoint
    printer0 printer1 printer2 printer3 - printer
    robot0 robot1 robot2 - robot
)
(:init
    (robot_at robot0 wp0)
    (nocarrying_papers robot0)
    (undocked robot0)
    (localised robot0)

    (robot_at robot1 wp0)
    (nocarrying_papers robot1)
    (undocked robot1)
    (localised robot1)

    (robot_at robot2 wp0)
    (nocarrying_papers robot2)
    (undocked robot2)
    (localised robot2)

    (dock_at wp0)

    (delivery_destination wp0)
    (delivery_destination wp1)
    (delivery_destination wp2)
    (delivery_destination wp3)
    (delivery_destination wp4)
    (delivery_destination wp5)
    (delivery_destination wp6)

    (= (distance wp0 wp1) 44)
    (= (distance wp1 wp0) 44)
    (= (distance wp0 wp2) 46)
    (= (distance wp2 wp0) 46)
    (= (distance wp0 wp3) 62)
    (= (distance wp3 wp0) 62)
    (= (distance wp0 wp4) 73)
    (= (distance wp4 wp0) 73)
    (= (distance wp0 wp5) 34)
    (= (distance wp5 wp0) 34)
    (= (distance wp0 wp6) 32)
    (= (distance wp6 wp0) 32)
    (= (distance wp0 printer0) 75)
    (= (distance printer0 wp0) 75)
    (= (distance wp0 printer1) 32)
    (= (distance printer1 wp0) 32)
    (= (distance wp0 printer2) 76)
    (= (distance printer2 wp0) 76)
    (= (distance wp0 printer3) 50)
    (= (distance printer3 wp0) 50)
    (= (distance wp1 wp2) 32)
    (= (distance wp2 wp1) 32)
    (= (distance wp1 wp3) 76)
    (= (distance wp3 wp1) 76)
    (= (distance wp1 wp4) 117)
    (= (distance wp4 wp1) 117)
    (= (distance wp1 wp5) 14)
    (= (distance wp5 wp1) 14)
    (= (distance wp1 wp6) 42)
    (= (distance wp6 wp1) 42)
    (= (distance wp1 printer0) 119)
    (= (distance printer0 wp1) 119)
    (= (distance wp1 printer1) 24)
    (= (distance printer1 wp1) 24)
    (= (distance wp1 printer2) 64)
    (= (distance printer2 wp1) 64)
    (= (distance wp1 printer3) 36)
    (= (distance printer3 wp1) 36)
    (= (distance wp2 wp3) 44)
    (= (distance wp3 wp2) 44)
    (= (distance wp2 wp4) 119)
    (= (distance wp4 wp2) 119)
    (= (distance wp2 wp5) 46)
    (= (distance wp5 wp2) 46)
    (= (distance wp2 wp6) 50)
    (= (distance wp6 wp2) 50)
    (= (distance wp2 printer0) 121)
    (= (distance printer0 wp2) 121)
    (= (distance wp2 printer1) 14)
    (= (distance printer1 wp2) 14)
    (= (distance wp2 printer2) 94)
    (= (distance printer2 wp2) 94)
    (= (distance wp2 printer3) 68)
    (= (distance printer3 wp2) 68)
    (= (distance wp3 wp4) 103)
    (= (distance wp4 wp3) 103)
    (= (distance wp3 wp5) 90)
    (= (distance wp5 wp3) 90)
    (= (distance wp3 wp6) 94)
    (= (distance wp6 wp3) 94)
    (= (distance wp3 printer0) 95)
    (= (distance printer0 wp3) 95)
    (= (distance wp3 printer1) 52)
    (= (distance printer1 wp3) 52)
    (= (distance wp3 printer2) 138)
    (= (distance printer2 wp3) 138)
    (= (distance wp3 printer3) 112)
    (= (distance printer3 wp3) 112)
    (= (distance wp4 wp5) 107)
    (= (distance wp5 wp4) 107)
    (= (distance wp4 wp6) 75)
    (= (distance wp6 wp4) 75)
    (= (distance wp4 printer0) 8)
    (= (distance printer0 wp4) 8)
    (= (distance wp4 printer1) 105)
    (= (distance printer1 wp4) 105)
    (= (distance wp4 printer2) 53)
    (= (distance printer2 wp4) 53)
    (= (distance wp4 printer3) 113)
    (= (distance printer3 wp4) 113)
    (= (distance wp5 wp6) 32)
    (= (distance wp6 wp5) 32)
    (= (distance wp5 printer0) 109)
    (= (distance printer0 wp5) 109)
    (= (distance wp5 printer1) 38)
    (= (distance printer1 wp5) 38)
    (= (distance wp5 printer2) 54)
    (= (distance printer2 wp5) 54)
    (= (distance wp5 printer3) 22)
    (= (distance printer3 wp5) 22)
    (= (distance wp6 printer0) 77)
    (= (distance printer0 wp6) 77)
    (= (distance wp6 printer1) 42)
    (= (distance printer1 wp6) 42)
    (= (distance wp6 printer2) 44)
    (= (distance printer2 wp6) 44)
    (= (distance wp6 printer3) 38)
    (= (distance printer3 wp6) 38)
    (= (distance printer0 printer1) 107)
    (= (distance printer1 printer0) 107)
    (= (distance printer0 printer2) 55)
    (= (distance printer2 printer0) 55)
    (= (distance printer0 printer3) 115)
    (= (distance printer3 printer0) 115)
    (= (distance printer1 printer2) 86)
    (= (distance printer2 printer1) 86)
    (= (distance printer1 printer3) 60)
    (= (distance printer3 printer1) 60)
    (= (distance printer2 printer3) 60)
    (= (distance printer3 printer2) 60)
)
(:goal (and
    (papers_delivered wp5)
    (papers_delivered wp5)
    (papers_delivered wp2)
    (papers_delivered wp0)
    (papers_delivered wp1)
    (papers_delivered wp2)
    (papers_delivered wp5)
))
)
