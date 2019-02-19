(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 - waypoint
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
    (delivery_destination wp6)

    (at 683.985 (not (delivery_destination wp0)))
    (at 683.985 (not (delivery_destination wp1)))
    (at 683.985 (not (delivery_destination wp2)))
    (at 683.985 (not (delivery_destination wp3)))
    (at 683.985 (not (delivery_destination wp4)))
    (at 683.985 (not (delivery_destination wp5)))
    (at 683.985 (not (delivery_destination wp6)))

    (= (distance wp0 wp1) 86)
    (= (distance wp1 wp0) 86)
    (= (distance wp0 wp2) 72)
    (= (distance wp2 wp0) 72)
    (= (distance wp0 wp3) 106)
    (= (distance wp3 wp0) 106)
    (= (distance wp0 wp4) 51)
    (= (distance wp4 wp0) 51)
    (= (distance wp0 wp5) 141)
    (= (distance wp5 wp0) 141)
    (= (distance wp0 wp6) 91)
    (= (distance wp6 wp0) 91)
    (= (distance wp0 printer0) 70)
    (= (distance printer0 wp0) 70)
    (= (distance wp0 printer1) 148)
    (= (distance printer1 wp0) 148)
    (= (distance wp0 printer2) 31)
    (= (distance printer2 wp0) 31)
    (= (distance wp0 printer3) 87)
    (= (distance printer3 wp0) 87)
    (= (distance wp1 wp2) 24)
    (= (distance wp2 wp1) 24)
    (= (distance wp1 wp3) 104)
    (= (distance wp3 wp1) 104)
    (= (distance wp1 wp4) 57)
    (= (distance wp4 wp1) 57)
    (= (distance wp1 wp5) 99)
    (= (distance wp5 wp1) 99)
    (= (distance wp1 wp6) 57)
    (= (distance wp6 wp1) 57)
    (= (distance wp1 printer0) 16)
    (= (distance printer0 wp1) 16)
    (= (distance wp1 printer1) 106)
    (= (distance printer1 wp1) 106)
    (= (distance wp1 printer2) 55)
    (= (distance printer2 wp1) 55)
    (= (distance wp1 printer3) 45)
    (= (distance printer3 wp1) 45)
    (= (distance wp2 wp3) 90)
    (= (distance wp3 wp2) 90)
    (= (distance wp2 wp4) 43)
    (= (distance wp4 wp2) 43)
    (= (distance wp2 wp5) 123)
    (= (distance wp5 wp2) 123)
    (= (distance wp2 wp6) 73)
    (= (distance wp6 wp2) 73)
    (= (distance wp2 printer0) 18)
    (= (distance printer0 wp2) 18)
    (= (distance wp2 printer1) 130)
    (= (distance printer1 wp2) 130)
    (= (distance wp2 printer2) 41)
    (= (distance printer2 wp2) 41)
    (= (distance wp2 printer3) 69)
    (= (distance printer3 wp2) 69)
    (= (distance wp3 wp4) 55)
    (= (distance wp4 wp3) 55)
    (= (distance wp3 wp5) 73)
    (= (distance wp5 wp3) 73)
    (= (distance wp3 wp6) 47)
    (= (distance wp6 wp3) 47)
    (= (distance wp3 printer0) 88)
    (= (distance printer0 wp3) 88)
    (= (distance wp3 printer1) 60)
    (= (distance printer1 wp3) 60)
    (= (distance wp3 printer2) 97)
    (= (distance printer2 wp3) 97)
    (= (distance wp3 printer3) 69)
    (= (distance printer3 wp3) 69)
    (= (distance wp4 wp5) 90)
    (= (distance wp5 wp4) 90)
    (= (distance wp4 wp6) 40)
    (= (distance wp6 wp4) 40)
    (= (distance wp4 printer0) 41)
    (= (distance printer0 wp4) 41)
    (= (distance wp4 printer1) 97)
    (= (distance printer1 wp4) 97)
    (= (distance wp4 printer2) 42)
    (= (distance printer2 wp4) 42)
    (= (distance wp4 printer3) 36)
    (= (distance printer3 wp4) 36)
    (= (distance wp5 wp6) 50)
    (= (distance wp6 wp5) 50)
    (= (distance wp5 printer0) 105)
    (= (distance printer0 wp5) 105)
    (= (distance wp5 printer1) 13)
    (= (distance printer1 wp5) 13)
    (= (distance wp5 printer2) 132)
    (= (distance printer2 wp5) 132)
    (= (distance wp5 printer3) 54)
    (= (distance printer3 wp5) 54)
    (= (distance wp6 printer0) 55)
    (= (distance printer0 wp6) 55)
    (= (distance wp6 printer1) 57)
    (= (distance printer1 wp6) 57)
    (= (distance wp6 printer2) 82)
    (= (distance printer2 wp6) 82)
    (= (distance wp6 printer3) 22)
    (= (distance printer3 wp6) 22)
    (= (distance printer0 printer1) 112)
    (= (distance printer1 printer0) 112)
    (= (distance printer0 printer2) 39)
    (= (distance printer2 printer0) 39)
    (= (distance printer0 printer3) 51)
    (= (distance printer3 printer0) 51)
    (= (distance printer1 printer2) 139)
    (= (distance printer2 printer1) 139)
    (= (distance printer1 printer3) 61)
    (= (distance printer3 printer1) 61)
    (= (distance printer2 printer3) 78)
    (= (distance printer3 printer2) 78)

)
(:goal (and
    (papers_delivered wp6)
))
)
