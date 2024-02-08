(define (domain ROVER)
	(:requirements :adl :typing)
	(:types waypoint rock - object)
	(:predicates
		(roverAt ?x - waypoint)
		(rockAt ?x - rock ?y - waypoint)
		(resultCollectedAbout ?x - rock)
		(connectionAt ?x - waypoint)
		(connected ?x - waypoint ?y - waypoint)
		(transmitted ?x - rock)
	)

	(:action move-rover
		:parameters (?x - waypoint ?y - waypoint)
		:precondition (and
			(roverAt ?x)
			(connected ?x ?y)
		)
		:effect (and
			(roverAt ?y)
			(not (roverAt ?x))
		)
	)

	(:action analyse-rock
		:parameters (?x - waypoint ?y - rock)
		:precondition (and
			(roverAt ?x)
			(rockAt ?y ?x)
			(not (resultCollectedAbout ?y))
		)
		:effect (and
			(resultCollectedAbout ?y)
		)
	)

	(:action transmit-rock-findings
		:parameters (?x - waypoint ?y - rock)
		:precondition (and
			(roverAt ?x)
			(connectionAt ?x)
			(resultCollectedAbout ?y)
			(not (transmitted ?y))
		)
		:effect (and
			(transmitted ?y)
		)
	)
)
