(define (problem WB)
	(:domain WB)
	(:objects C1 C2 C3 C4 - cell
			  B W1 W2 -	tile
	)
	(:INIT	(on B C1) (on W1 C2) (on W2 C3) (empty C4)
			(toRightOf W1 B) (toRightOf W2 B) (toRightOf W2 W1)
			(neighbourTo C1 C2) (neighbourTo C2 C1)
			(neighbourTo C2 C3) (neighbourTo C3 C2)
			(neighbourTo C3 C4) (neighbourTo C4 C3)
            (= (hop-cost ) 1)
            (= (double-hop-cost ) 2)
            (= (total-cost) 0)
	)
	(:GOAL (AND (toRightOf B W1) (toRightOf B W2)))
	(:metric minimize (total-cost))
)

;
; The white black puzzle problem file.
; 	C1 C2 C3 and C4 are cells
;	B W1 W2 are counters.
;
; Inital state:
;	B counter is on cell C1, W1 counter is on C3, W2 counter is on C3, C4 is empty
;	W1 is to the right of B, W2 is to the right of B and W2 is to the right of W1.
;	the cells neighbour relations are set.
;	hop-cost and double-hop-cost are set to their value, total-cost is initialised to zero.
;
;The goal is for B to be the on the right of both W1 and W2.
; the total-cost should be minimized as well.
