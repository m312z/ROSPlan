(define (problem task)
(:domain rcllsimple)
(:objects
    o0 o1 - order
    r0 - robot
    s0 - shelf
    rs0 - ring_station
    bs0 - base_station
    ow0 ow1 - order_window
)
(:init
    (robot_at r0 s0)


    (not_carrying_order r0)

    (not_collected o0)
    (not_collected o1)




    (accepts_order o0 ow0)
    (accepts_order o1 ow1)

    (open ow0)
    (open ow1)

    (at 369.205 (not (open ow0)))
    (at 1025.38 (not (open ow1)))

    (= (ring_count o0) 1)
    (= (ring_count o1) 3)

)
(:goal (and
    (order_delivered)
))
)
