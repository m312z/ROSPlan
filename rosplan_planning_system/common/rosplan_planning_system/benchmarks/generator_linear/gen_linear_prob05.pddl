(define (problem run-generator2)
    (:domain generator_linear)
    (:objects gen - generator tank1 tank2 tank3 tank4 tank5 - tank)
    (:init 	(= (fuelLevel gen)  920)
		(= (capacity gen)  1000)
		(available tank1)
		(available tank2)
		(available tank3)
		(available tank4)
		(available tank5)
     )  
     (:goal (generator-ran))
)
