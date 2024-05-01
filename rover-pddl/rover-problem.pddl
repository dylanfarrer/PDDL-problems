(define (problem ROVER)
	(:domain ROVER)
	(:objects A B C D E F G - waypoint
			  Br Er Dr Cr - rock
	)
	(:INIT (ROVERAT G)
		   (ROCKAT Br B) (ROCKAT Er E) (ROCKAT Dr D) (ROCKAT Cr C)
		   (CONNECTIONAT A)
		   (CONNECTED F A) (CONNECTED A B) (CONNECTED G F) (CONNECTED B G) (CONNECTED G B)
		   (CONNECTED B C) (CONNECTED C B) (CONNECTED C D) (CONNECTED D C) (CONNECTED D E)
		   (CONNECTED E G) (CONNECTED G E)
	)
	(:GOAL (AND (TRANSMITTED Br) (TRANSMITTED Er) (TRANSMITTED Dr) (TRANSMITTED Cr)))
)

;
; The Robotic explorer (rover) problem file.
; 	A B .. G are waypoints that the rover can visit
;	Br, Er, Dr, Cr represent the rocks at the correspoding waypoints the rover must analyse.
;
; Inital state:
;	The rover is at G, the rocks are placed at their locations, the transmit connection is set to A,
;	The paths between waypoints are set.
;
;The goal is for every rock analysis to be transmitted.
