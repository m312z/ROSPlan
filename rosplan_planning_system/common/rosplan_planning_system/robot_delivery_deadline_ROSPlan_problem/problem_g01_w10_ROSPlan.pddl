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

    (at 149.313 (not (delivery_destination wp0)))
    (at 149.313 (not (delivery_destination wp1)))
    (at 149.313 (not (delivery_destination wp2)))
    (at 149.313 (not (delivery_destination wp3)))
    (at 149.313 (not (delivery_destination wp4)))
    (at 149.313 (not (delivery_destination wp5)))
    (at 149.313 (not (delivery_destination wp6)))
    (at 149.313 (not (delivery_destination wp7)))
    (at 149.313 (not (delivery_destination wp8)))
    (at 149.313 (not (delivery_destination wp9)))

    (= (distance wp0 wp1) 77)
    (= (distance wp1 wp0) 77)
    (= (distance wp0 wp2) 34)
    (= (distance wp2 wp0) 34)
    (= (distance wp0 wp3) 38)
    (= (distance wp3 wp0) 38)
    (= (distance wp0 wp4) 59)
    (= (distance wp4 wp0) 59)
    (= (distance wp0 wp5) 34)
    (= (distance wp5 wp0) 34)
    (= (distance wp0 wp6) 79)
    (= (distance wp6 wp0) 79)
    (= (distance wp0 wp7) 43)
    (= (distance wp7 wp0) 43)
    (= (distance wp0 wp8) 73)
    (= (distance wp8 wp0) 73)
    (= (distance wp0 wp9) 37)
    (= (distance wp9 wp0) 37)
    (= (distance wp0 printer0) 55)
    (= (distance printer0 wp0) 55)
    (= (distance wp0 printer1) 115)
    (= (distance printer1 wp0) 115)
    (= (distance wp0 printer2) 10)
    (= (distance printer2 wp0) 10)
    (= (distance wp0 printer3) 54)
    (= (distance printer3 wp0) 54)
    (= (distance wp1 wp2) 83)
    (= (distance wp2 wp1) 83)
    (= (distance wp1 wp3) 93)
    (= (distance wp3 wp1) 93)
    (= (distance wp1 wp4) 28)
    (= (distance wp4 wp1) 28)
    (= (distance wp1 wp5) 43)
    (= (distance wp5 wp1) 43)
    (= (distance wp1 wp6) 8)
    (= (distance wp6 wp1) 8)
    (= (distance wp1 wp7) 120)
    (= (distance wp7 wp1) 120)
    (= (distance wp1 wp8) 4)
    (= (distance wp8 wp1) 4)
    (= (distance wp1 wp9) 84)
    (= (distance wp9 wp1) 84)
    (= (distance wp1 printer0) 34)
    (= (distance printer0 wp1) 34)
    (= (distance wp1 printer1) 56)
    (= (distance printer1 wp1) 56)
    (= (distance wp1 printer2) 87)
    (= (distance printer2 wp1) 87)
    (= (distance wp1 printer3) 59)
    (= (distance printer3 wp1) 59)
    (= (distance wp2 wp3) 68)
    (= (distance wp3 wp2) 68)
    (= (distance wp2 wp4) 55)
    (= (distance wp4 wp2) 55)
    (= (distance wp2 wp5) 40)
    (= (distance wp5 wp2) 40)
    (= (distance wp2 wp6) 85)
    (= (distance wp6 wp2) 85)
    (= (distance wp2 wp7) 37)
    (= (distance wp7 wp2) 37)
    (= (distance wp2 wp8) 79)
    (= (distance wp8 wp2) 79)
    (= (distance wp2 wp9) 59)
    (= (distance wp9 wp2) 59)
    (= (distance wp2 printer0) 49)
    (= (distance printer0 wp2) 49)
    (= (distance wp2 printer1) 81)
    (= (distance printer1 wp2) 81)
    (= (distance wp2 printer2) 24)
    (= (distance printer2 wp2) 24)
    (= (distance wp2 printer3) 60)
    (= (distance printer3 wp2) 60)
    (= (distance wp3 wp4) 93)
    (= (distance wp4 wp3) 93)
    (= (distance wp3 wp5) 64)
    (= (distance wp5 wp3) 64)
    (= (distance wp3 wp6) 85)
    (= (distance wp6 wp3) 85)
    (= (distance wp3 wp7) 81)
    (= (distance wp7 wp3) 81)
    (= (distance wp3 wp8) 91)
    (= (distance wp8 wp3) 91)
    (= (distance wp3 wp9) 9)
    (= (distance wp9 wp3) 9)
    (= (distance wp3 printer0) 89)
    (= (distance printer0 wp3) 89)
    (= (distance wp3 printer1) 149)
    (= (distance printer1 wp3) 149)
    (= (distance wp3 printer2) 48)
    (= (distance printer2 wp3) 48)
    (= (distance wp3 printer3) 34)
    (= (distance printer3 wp3) 34)
    (= (distance wp4 wp5) 29)
    (= (distance wp5 wp4) 29)
    (= (distance wp4 wp6) 30)
    (= (distance wp6 wp4) 30)
    (= (distance wp4 wp7) 92)
    (= (distance wp7 wp4) 92)
    (= (distance wp4 wp8) 24)
    (= (distance wp8 wp4) 24)
    (= (distance wp4 wp9) 84)
    (= (distance wp9 wp4) 84)
    (= (distance wp4 printer0) 6)
    (= (distance printer0 wp4) 6)
    (= (distance wp4 printer1) 56)
    (= (distance printer1 wp4) 56)
    (= (distance wp4 printer2) 59)
    (= (distance printer2 wp4) 59)
    (= (distance wp4 printer3) 59)
    (= (distance printer3 wp4) 59)
    (= (distance wp5 wp6) 45)
    (= (distance wp6 wp5) 45)
    (= (distance wp5 wp7) 77)
    (= (distance wp7 wp5) 77)
    (= (distance wp5 wp8) 39)
    (= (distance wp8 wp5) 39)
    (= (distance wp5 wp9) 55)
    (= (distance wp9 wp5) 55)
    (= (distance wp5 printer0) 25)
    (= (distance printer0 wp5) 25)
    (= (distance wp5 printer1) 85)
    (= (distance printer1 wp5) 85)
    (= (distance wp5 printer2) 44)
    (= (distance printer2 wp5) 44)
    (= (distance wp5 printer3) 30)
    (= (distance printer3 wp5) 30)
    (= (distance wp6 wp7) 122)
    (= (distance wp7 wp6) 122)
    (= (distance wp6 wp8) 6)
    (= (distance wp8 wp6) 6)
    (= (distance wp6 wp9) 76)
    (= (distance wp9 wp6) 76)
    (= (distance wp6 printer0) 36)
    (= (distance printer0 wp6) 36)
    (= (distance wp6 printer1) 64)
    (= (distance printer1 wp6) 64)
    (= (distance wp6 printer2) 89)
    (= (distance printer2 wp6) 89)
    (= (distance wp6 printer3) 51)
    (= (distance printer3 wp6) 51)
    (= (distance wp7 wp8) 116)
    (= (distance wp8 wp7) 116)
    (= (distance wp7 wp9) 80)
    (= (distance wp9 wp7) 80)
    (= (distance wp7 printer0) 86)
    (= (distance printer0 wp7) 86)
    (= (distance wp7 printer1) 86)
    (= (distance printer1 wp7) 86)
    (= (distance wp7 printer2) 33)
    (= (distance printer2 wp7) 33)
    (= (distance wp7 printer3) 97)
    (= (distance printer3 wp7) 97)
    (= (distance wp8 wp9) 82)
    (= (distance wp9 wp8) 82)
    (= (distance wp8 printer0) 30)
    (= (distance printer0 wp8) 30)
    (= (distance wp8 printer1) 58)
    (= (distance printer1 wp8) 58)
    (= (distance wp8 printer2) 83)
    (= (distance printer2 wp8) 83)
    (= (distance wp8 printer3) 57)
    (= (distance printer3 wp8) 57)
    (= (distance wp9 printer0) 80)
    (= (distance printer0 wp9) 80)
    (= (distance wp9 printer1) 140)
    (= (distance printer1 wp9) 140)
    (= (distance wp9 printer2) 47)
    (= (distance printer2 wp9) 47)
    (= (distance wp9 printer3) 25)
    (= (distance printer3 wp9) 25)
    (= (distance printer0 printer1) 60)
    (= (distance printer1 printer0) 60)
    (= (distance printer0 printer2) 53)
    (= (distance printer2 printer0) 53)
    (= (distance printer0 printer3) 55)
    (= (distance printer3 printer0) 55)
    (= (distance printer1 printer2) 105)
    (= (distance printer2 printer1) 105)
    (= (distance printer1 printer3) 115)
    (= (distance printer3 printer1) 115)
    (= (distance printer2 printer3) 64)
    (= (distance printer3 printer2) 64)

)
(:goal (and
    (papers_delivered wp0)
))
)
