(define (domain example)
  (:requirements :fluents :durative-actions :duration-inequalities :adl :typing :time :negative-preconditions)
  (:types sample)
  (:predicates (navigating) (collected ?s - sample))
  (:functions (distance))

  (:durative-action navigate
   :parameters ()
   :duration (and (>= ?duration 5) (<= ?duration 15))
   :condition (and (at start (not (navigating))))
   :effect (and (at start (navigating))
  	        (at end (not (navigating)))
                (increase distance (* #t 2)))
  )

  (:durative-action collectsample
   :parameters (?s - sample)
   :duration (and (>= ?duration 15)
                  (<= ?duration 20))
   :condition (and (over all (not (navigating))))
   :effect (and (at end (collected ?s)))
  )
)
