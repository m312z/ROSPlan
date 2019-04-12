(define (problem example_problem)
(:domain rcllsimple)
(:objects
    s0 - shelf
    bs0 - base_station
    rs0 - ring_station
    r0 - robot
    o0 - order
    ow0 - order_window
)
(:init
    ;; robot
    (robot_at r0 s0)
    (not_carrying_order r0 )
    ;; order
    (not_collected o0)
    (= (ring_count o0) 1)
    ;; order window
    (open ow0)
    (accepts_order o0 ow0)
    ;; order window closes
    (at 301 (not (open ow0)))
)
(:goal (and
    (order_delivered)
)))
