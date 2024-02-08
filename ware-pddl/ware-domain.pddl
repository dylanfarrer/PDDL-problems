(define (domain WARE)
	(:requirements :adl :typing)
	(:types location package crate - object)
	(:predicates
		(truckAt ?x - location)
		(crateAt ?x - crate ?y - location)
		(packageAt ?x - package ?y - location)
		(packageIn ?x - package ?y - crate)
		(truckSecured)
		(crateInTruck ?x - crate)
	)
	(:action drive
		:parameters ()
		:precondition (and)
		:effect (and)
	)

	(:action lift
		:parameters ()
		:precondition (and)
		:effect (and)
	)

	(:action fillCrate
		:parameters ()
		:precondition (and)
		:effect (and)
	)

	(:action dropCrate
		:parameters ()
		:precondition (and)
		:effect (and)
	)

	(:action secure
		:parameters ()
		:precondition (and)
		:effect (and)
	)
)