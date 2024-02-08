(define (problem WARE)
	(:domain WARE)
	(:objects C1 C2 C3 C4 - cell
			  B W1 W2 -	tile
	)
	(:INIT	(on B C1) (on W1 C2) (on W2 C3) (empty C4)
			(toRightOf W1 B) (toRightOf W2 B) (toRightOf W2 W1)
			(neighbourTo C1 C2) (neighbourTo C2 C1)
			(neighbourTo C2 C3) (neighbourTo C3 C2)
			(neighbourTo C3 C4) (neighbourTo C4 C3)
	)
	(:GOAL (AND (toRightOf B W1) (toRightOf B W2)))
)
