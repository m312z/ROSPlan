(define (domain generator_linear)
(:requirements :fluents :durative-actions :duration-inequalities :adl :typing)
(:types generator tank)
(:predicates (generator-ran) (available ?t - tank))

(:functions (fuelLevel ?g - generator) (capacity ?g - generator) )

(:durative-action generate
 :parameters (?g - generator)
 :duration (= ?duration  1000)
 :condition (over all (>= (fuelLevel ?g) 0))
 :effect (and (decrease (fuelLevel ?g) (* #t 1))
			  (at end (generator-ran))))

(:action refuel
 :parameters (?g - generator ?t - tank)
 :precondition (and (available ?t) (>= (capacity ?g) (+ (fuelLevel ?g) 20)))
 :effect (and (increase (fuelLevel ?g) 20)
              (not (available ?t)))
)
)