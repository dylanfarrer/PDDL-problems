(define (domain WB)
	(:requirements :adl :typing :action-costs)
	(:types cell tile - object)
	(:predicates
		(toRightOf ?x - tile ?y - tile) ; used to reason about the goal state
		(on ?x - tile ?y - cell)
		(empty ?x - cell)
		(neighbourTo ?x - cell ?y - cell)
	)
	(:functions ; functions to create action cost
        (hop-cost) - number
        (double-hop-cost) - number
        (total-cost) - number
    )
	(:action moveOne
		:parameters (?x - tile ?y - cell ?z - cell)
		:precondition (and
			(on ?x ?y)
			(neighbourTo ?y ?z)
			(empty ?z)
		)
		:effect (and
			(on ?x ?z)
			(not (on ?x ?y))
			(empty ?y)
			(not (empty ?z))
			(increase (total-cost) (hop-cost )) ; append to total cost
		)
	)

	(:action jumpOverToTheRight ; right and left are seperate methods so that the 'toTheRightOf' variable can be adjusted correctly.
		:parameters (?x - tile ?y - cell ?x1 - tile ?y1 - cell ?z - cell)
		:precondition (and
			(on ?x ?y)
			(on ?x1 ?y1)
			(empty ?z)
			(toRightOf ?x1 ?x)
			(neighbourTo ?y ?y1)
			(neighbourTo ?y1 ?z)
		)
		:effect (and
			(on ?x ?z)
			(not (on ?x ?y))
			(empty ?y)
			(toRightOf ?x ?x1)
			(not (toRightOf ?x1 ?x))
			(not (empty ?z))
			(increase (total-cost) (double-hop-cost )) ; append to total cost
		)
	)

	(:action jumpOverToTheLeft
		:parameters (?x - tile ?y - cell ?x1 - tile ?y1 - cell ?z - cell)
		:precondition (and
			(on ?x ?y)
			(on ?x1 ?y1)
			(empty ?z)
			(toRightOf ?x ?x1)
			(neighbourTo ?y ?y1)
			(neighbourTo ?y1 ?z)
		)
		:effect (and
			(on ?x ?z)
			(not (on ?x ?y))
			(empty ?y)
			(toRightOf ?x1 ?x)
			(not (toRightOf ?x ?x1))
			(not (empty ?z))
			(increase (total-cost) (double-hop-cost )) ; append to total cost
		)
	)
)
