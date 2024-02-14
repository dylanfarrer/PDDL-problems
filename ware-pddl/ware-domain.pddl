(define (domain WARE)
	(:requirements :adl :typing)
	(:types location liftableObject - object
			package crate - liftableObject)
	(:predicates
		(truckAt ?x - location)
		(objectAt ?x - liftableObject ?y - location)
		(packageIn ?x - package ?y - crate)
		(objectLifted ?x - liftableObject)
		(truckSecured)
		(crateInTruck ?x - crate)
	)
	(:action drive
		:parameters (?x - location ?y - location)
		:precondition (and
			(truckAt ?x)
			(truckSecured)
		)
		:effect (and
			(truckAt ?y)
			(not (truckAt ?x))
		)
	)

	(:action lift
		:parameters (?x - location ?y - liftableObject)
		:precondition (and
			(truckSecured)
			(truckAt ?x)
			(objectAt ?y ?x)
		)
		:effect (and
			(not (truckSecured))
			(not (objectAt ?y ?x))
			(objectLifted ?y)
		)
	)

	(:action fillCrate
		:parameters (?x - location ?y - package ?z - crate)
		:precondition (and
			(truckAt ?x)
			(objectLifted ?y)
			(objectAt ?z ?x)
		)
		:effect (and
			(not (objectLifted ?y))
			(packageIn ?y ?z)
			(truckSecured)
		)
	)

	(:action dropCrate
		:parameters (?x - location ?y - crate)
		:precondition (and
			(truckAt ?x)
			(crateInTruck ?y)
			(truckSecured)
		)
		:effect (and
			(not (crateInTruck ?y))
			(objectAt ?y ?x)
		)
	)

	(:action secure
		:parameters (?x - crate)
		:precondition (and
			(objectLifted ?x)
		)
		:effect (and
			(truckSecured)
			(not (objectLifted ?x))
			(crateInTruck ?x)
		)
	)
)
