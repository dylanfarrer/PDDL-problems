(define (domain WARE)
	(:requirements :adl :typing)
	(:types cell tile - object)
	(:predicates
		(toRightOf ?x - tile ?y - tile)
		(on ?x - tile ?y - cell)
		(empty ?x - cell)
		(neighbourTo ?x - cell ?y - cell)
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
		)
	)

	(:action jumpOverToTheRight
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
		)
	)
)
