(define (domain generator2 )
(:requirements :fluents :durative-actions :typing :negative-preconditions :time :duration-inequalities  :timed-initial-literals)
(:types generalBattery battery rover )
(:predicates (gboff ?gb - generalBattery) (gbon ?gb - generalBattery) (off ?b - battery) (on ?b - battery) (inuse ?r - rover)(night) (sunexposure) (solarsupport) (datatosend) (datasent) (roversafe ?r - rover))
(:functions (roverenergy ?r - rover) (SoC ?b - battery) (SoCGB ?gb - generalBattery))


(:durative-action switchGenBatteryOn
:parameters (?gb - generalBattery ?r - rover)
 :duration (>= ?duration 0)
 :condition (and 
 			(at start (inuse ?r))	
 			(at start (gboff ?gb))
 			(over all (>= (SoCGB ?gb) 0)))
 :effect (and 
 			(at start (gbon ?gb))
 			(at end (roversafe ?r))
 			(at start (not (gboff ?gb)))
 			(at start (not (inuse ?r)))      
	      	(decrease (SoCGB ?gb) (* #t 10))
	      	(increase (roverenergy ?r) (* #t 10))
	      	(at end (not (gbon ?gb)))
	      	(at end (inuse ?r))
	  ))


(:durative-action useBattery
 :parameters (?b - battery ?r - rover)
 :duration (>= ?duration 0)
 :condition (and 
 			(at start (inuse ?r))
 			(at start (off ?b))
 			(over all (>= (SoC ?b) 0))
 			)
 :effect (and 
 			(at start (not (inuse ?r)))
 			(at start (on ?b))
 			(at start (not (off ?b)))      
	      	(decrease (SoC ?b) (* #t 5))
	      	(increase (roverenergy ?r) (* #t 10))
	      	(at end (not (on ?b)))
	      	(at end (inuse ?r))
	      	(at end (roversafe ?r))
	  ))

(:event sunshine
 :parameters (?r - rover)
 :precondition (and (night) (sunexposure))
 :effect (and (not (night)) (increase (roverenergy ?r) 400))
)


(:action sendData
 :parameters (?r - rover)
 :precondition (and (datatosend) (roversafe ?r) (>= (roverenergy ?r) 500))
 :effect (and (datasent) (not (datatosend)))
)


)


(define (problem run-generator2)
(:domain generator)
(:objects b1 b2 b3 b4 b5 - battery GB - generalBattery r - rover)
(:init
   (= (roverenergy r) 200)
   (night)
   (datatosend)
   (inuse r)
   (gboff GB)
   (= (SoCGB GB) 180)
   (= (SoC b1) 10)
   (off b1)
   (off b2)
   (= (SoC b2) 10)
   (off b3)
   (= (SoC b3) 10)
   (off b4)
   (= (SoC b4) 30)
   (off b5)
   (= (SoC b5) 30)
   (at 50.0 (sunexposure)))

(:goal (datasent))
(:metric minimize ( total-time ))
)
