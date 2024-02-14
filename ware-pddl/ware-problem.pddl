(define (problem WARE)
	(:domain WARE)
	(:objects BASE W2 W0 W1 - location
			  A B - package
			  C - crate
	)
	(:INIT (truckAt BASE) (truckSecured)
		   (objectAt A W0) (objectAt C W0) (objectAt B W2)
	)
	(:GOAL (AND (truckAt W0) (truckSecured) (packageIn A C) (packageIn B C) (objectAt C W1)))
)
