(define (problem pandora_strategic_mission)
(:domain pandora_domain_strategic)
(:objects
auv - vehicle
mission_site_start_point_0 mission_site_start_point_1 wp_auv0 - waypoint
mission0 mission1 mission2 mission3 mission4 mission5 mission6 mission7 mission8 mission9 - mission
)
(:init
(vehicle_free auv)
(= (mission_total) 0)
(at auv wp_auv0) (= (charge auv) 1200)

(recharge_at mission_site_start_point_0)

(active mission0)
(active mission1)
(active mission2)
(active mission3)
(active mission4)
(active mission5)
(active mission6)
(active mission7)
(active mission8)
(active mission9)

(in mission0 mission_site_start_point_1)
(in mission1 mission_site_start_point_1)
(in mission2 mission_site_start_point_1)
(in mission3 mission_site_start_point_1)
(in mission4 mission_site_start_point_1)
(in mission5 mission_site_start_point_1)
(in mission6 mission_site_start_point_1)
(in mission7 mission_site_start_point_1)
(in mission8 mission_site_start_point_1)
(in mission9 mission_site_start_point_1)

(= (mission_duration mission0) 261.867)
(= (mission_duration mission1) 242.066)
(= (mission_duration mission2) 336.17)
(= (mission_duration mission3) 365.49)
(= (mission_duration mission4) 340.969)
(= (mission_duration mission5) 337.334)
(= (mission_duration mission6) 608.425)
(= (mission_duration mission7) 800.794)
(= (mission_duration mission8) 692.803)
(= (mission_duration mission9) 629.094)

(connected mission_site_start_point_0 mission_site_start_point_1) (= (distance mission_site_start_point_0 mission_site_start_point_1) 53.8888)
(connected mission_site_start_point_0 wp_auv0) (= (distance mission_site_start_point_0 wp_auv0) 56.7891)
(connected wp_auv0 mission_site_start_point_0) (= (distance wp_auv0 mission_site_start_point_0) 56.7891)
(connected mission_site_start_point_1 mission_site_start_point_0) (= (distance mission_site_start_point_1 mission_site_start_point_0) 53.8888)
(connected mission_site_start_point_1 wp_auv0) (= (distance mission_site_start_point_1 wp_auv0) 22.561)
(connected wp_auv0 mission_site_start_point_1) (= (distance wp_auv0 mission_site_start_point_1) 22.561)

)
                               (:goal (> (mission_total) 5))
)
