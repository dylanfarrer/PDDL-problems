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

;
; The warehouse domain problem file.
; 	BASE, W2, W0 and W1 are locations to visit
;	A and B are packages
;	C is the crate
;
; Inital state:
;	The truck is at base and secured, the A package is at W0, the B package is at W2, the crate is at W0
;
;The goal: the truck is at W0, the truck is secured, the packages are in the crate and the crate is at W1.