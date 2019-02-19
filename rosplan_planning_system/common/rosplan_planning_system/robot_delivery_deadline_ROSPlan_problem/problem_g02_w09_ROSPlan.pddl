(define (problem task)
(:domain turtlebot)
(:objects
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 - waypoint
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
    (delivery_destination wp7)
    (delivery_destination wp8)
    (delivery_destination wp9)

    (at 1615.54 (not (delivery_destination wp0)))
    (at 1615.54 (not (delivery_destination wp1)))
    (at 1615.54 (not (delivery_destination wp2)))
    (at 1615.54 (not (delivery_destination wp3)))
    (at 1615.54 (not (delivery_destination wp4)))
    (at 1615.54 (not (delivery_destination wp5)))
    (at 1615.54 (not (delivery_destination wp6)))
    (at 1615.54 (not (delivery_destination wp7)))
    (at 1615.54 (not (delivery_destination wp8)))
    (at 1615.54 (not (delivery_destination wp9)))

    (= (distance wp0 wp1) 8)
    (= (distance wp1 wp0) 8)
    (= (distance wp0 wp2) 45)
    (= (distance wp2 wp0) 45)
    (= (distance wp0 wp3) 45)
    (= (distance wp3 wp0) 45)
    (= (distance wp0 wp4) 65)
    (= (distance wp4 wp0) 65)
    (= (distance wp0 wp5) 41)
    (= (distance wp5 wp0) 41)
    (= (distance wp0 wp6) 112)
    (= (distance wp6 wp0) 112)
    (= (distance wp0 wp7) 80)
    (= (distance wp7 wp0) 80)
    (= (distance wp0 wp8) 22)
    (= (distance wp8 wp0) 22)
    (= (distance wp0 wp9) 59)
    (= (distance wp9 wp0) 59)
    (= (distance wp0 printer0) 47)
    (= (distance printer0 wp0) 47)
    (= (distance wp0 printer1) 67)
    (= (distance printer1 wp0) 67)
    (= (distance wp0 printer2) 83)
    (= (distance printer2 wp0) 83)
    (= (distance wp0 printer3) 48)
    (= (distance printer3 wp0) 48)
    (= (distance wp1 wp2) 43)
    (= (distance wp2 wp1) 43)
    (= (distance wp1 wp3) 37)
    (= (distance wp3 wp1) 37)
    (= (distance wp1 wp4) 57)
    (= (distance wp4 wp1) 57)
    (= (distance wp1 wp5) 33)
    (= (distance wp5 wp1) 33)
    (= (distance wp1 wp6) 104)
    (= (distance wp6 wp1) 104)
    (= (distance wp1 wp7) 78)
    (= (distance wp7 wp1) 78)
    (= (distance wp1 wp8) 20)
    (= (distance wp8 wp1) 20)
    (= (distance wp1 wp9) 61)
    (= (distance wp9 wp1) 61)
    (= (distance wp1 printer0) 39)
    (= (distance printer0 wp1) 39)
    (= (distance wp1 printer1) 59)
    (= (distance printer1 wp1) 59)
    (= (distance wp1 printer2) 81)
    (= (distance printer2 wp1) 81)
    (= (distance wp1 printer3) 50)
    (= (distance printer3 wp1) 50)
    (= (distance wp2 wp3) 40)
    (= (distance wp3 wp2) 40)
    (= (distance wp2 wp4) 66)
    (= (distance wp4 wp2) 66)
    (= (distance wp2 wp5) 28)
    (= (distance wp5 wp2) 28)
    (= (distance wp2 wp6) 73)
    (= (distance wp6 wp2) 73)
    (= (distance wp2 wp7) 35)
    (= (distance wp7 wp2) 35)
    (= (distance wp2 wp8) 23)
    (= (distance wp8 wp2) 23)
    (= (distance wp2 wp9) 104)
    (= (distance wp9 wp2) 104)
    (= (distance wp2 printer0) 30)
    (= (distance printer0 wp2) 30)
    (= (distance wp2 printer1) 28)
    (= (distance printer1 wp2) 28)
    (= (distance wp2 printer2) 38)
    (= (distance printer2 wp2) 38)
    (= (distance wp2 printer3) 93)
    (= (distance printer3 wp2) 93)
    (= (distance wp3 wp4) 26)
    (= (distance wp4 wp3) 26)
    (= (distance wp3 wp5) 12)
    (= (distance wp5 wp3) 12)
    (= (distance wp3 wp6) 67)
    (= (distance wp6 wp3) 67)
    (= (distance wp3 wp7) 75)
    (= (distance wp7 wp3) 75)
    (= (distance wp3 wp8) 25)
    (= (distance wp8 wp3) 25)
    (= (distance wp3 wp9) 64)
    (= (distance wp9 wp3) 64)
    (= (distance wp3 printer0) 10)
    (= (distance printer0 wp3) 10)
    (= (distance wp3 printer1) 50)
    (= (distance printer1 wp3) 50)
    (= (distance wp3 printer2) 78)
    (= (distance printer2 wp3) 78)
    (= (distance wp3 printer3) 53)
    (= (distance printer3 wp3) 53)
    (= (distance wp4 wp5) 38)
    (= (distance wp5 wp4) 38)
    (= (distance wp4 wp6) 47)
    (= (distance wp6 wp4) 47)
    (= (distance wp4 wp7) 101)
    (= (distance wp7 wp4) 101)
    (= (distance wp4 wp8) 45)
    (= (distance wp8 wp4) 45)
    (= (distance wp4 wp9) 46)
    (= (distance wp9 wp4) 46)
    (= (distance wp4 printer0) 36)
    (= (distance printer0 wp4) 36)
    (= (distance wp4 printer1) 76)
    (= (distance printer1 wp4) 76)
    (= (distance wp4 printer2) 104)
    (= (distance printer2 wp4) 104)
    (= (distance wp4 printer3) 31)
    (= (distance printer3 wp4) 31)
    (= (distance wp5 wp6) 71)
    (= (distance wp6 wp5) 71)
    (= (distance wp5 wp7) 63)
    (= (distance wp7 wp5) 63)
    (= (distance wp5 wp8) 21)
    (= (distance wp8 wp5) 21)
    (= (distance wp5 wp9) 76)
    (= (distance wp9 wp5) 76)
    (= (distance wp5 printer0) 6)
    (= (distance printer0 wp5) 6)
    (= (distance wp5 printer1) 38)
    (= (distance printer1 wp5) 38)
    (= (distance wp5 printer2) 66)
    (= (distance printer2 wp5) 66)
    (= (distance wp5 printer3) 65)
    (= (distance printer3 wp5) 65)
    (= (distance wp6 wp7) 100)
    (= (distance wp7 wp6) 100)
    (= (distance wp6 wp8) 92)
    (= (distance wp8 wp6) 92)
    (= (distance wp6 wp9) 93)
    (= (distance wp9 wp6) 93)
    (= (distance wp6 printer0) 65)
    (= (distance printer0 wp6) 65)
    (= (distance wp6 printer1) 45)
    (= (distance printer1 wp6) 45)
    (= (distance wp6 printer2) 65)
    (= (distance printer2 wp6) 65)
    (= (distance wp6 printer3) 78)
    (= (distance printer3 wp6) 78)
    (= (distance wp7 wp8) 58)
    (= (distance wp8 wp7) 58)
    (= (distance wp7 wp9) 139)
    (= (distance wp9 wp7) 139)
    (= (distance wp7 printer0) 65)
    (= (distance printer0 wp7) 65)
    (= (distance wp7 printer1) 55)
    (= (distance printer1 wp7) 55)
    (= (distance wp7 printer2) 37)
    (= (distance printer2 wp7) 37)
    (= (distance wp7 printer3) 128)
    (= (distance printer3 wp7) 128)
    (= (distance wp8 wp9) 81)
    (= (distance wp9 wp8) 81)
    (= (distance wp8 printer0) 27)
    (= (distance printer0 wp8) 27)
    (= (distance wp8 printer1) 47)
    (= (distance printer1 wp8) 47)
    (= (distance wp8 printer2) 61)
    (= (distance printer2 wp8) 61)
    (= (distance wp8 printer3) 70)
    (= (distance printer3 wp8) 70)
    (= (distance wp9 printer0) 74)
    (= (distance printer0 wp9) 74)
    (= (distance wp9 printer1) 114)
    (= (distance printer1 wp9) 114)
    (= (distance wp9 printer2) 142)
    (= (distance printer2 wp9) 142)
    (= (distance wp9 printer3) 15)
    (= (distance printer3 wp9) 15)
    (= (distance printer0 printer1) 40)
    (= (distance printer1 printer0) 40)
    (= (distance printer0 printer2) 68)
    (= (distance printer2 printer0) 68)
    (= (distance printer0 printer3) 63)
    (= (distance printer3 printer0) 63)
    (= (distance printer1 printer2) 28)
    (= (distance printer2 printer1) 28)
    (= (distance printer1 printer3) 103)
    (= (distance printer3 printer1) 103)
    (= (distance printer2 printer3) 131)
    (= (distance printer3 printer2) 131)

)
(:goal (and
    (papers_delivered wp6)
    (papers_delivered wp7)
))
)
