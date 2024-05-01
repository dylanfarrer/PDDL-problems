(define (domain ROVER)
	(:requirements :adl :typing)
	(:types waypoint rock - object) ; object oriented
	(:predicates
		(roverAt ?x - waypoint)
		(rockAt ?x - rock ?y - waypoint)
		(resultCollectedAbout ?x - rock) ; indicates a rock has been analysed
		(connectionAt ?x - waypoint) ; place that info can be transmitted from
		(connected ?x - waypoint ?y - waypoint) ; available paths
		(transmitted ?x - rock) ; has info been transmitted about this rock
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
			(not (resultCollectedAbout ?y)) ; can only analyse once
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
			(resultCollectedAbout ?y) ; can only transmit if analysed
			(not (transmitted ?y)) ; can only transmit once
		)
		:effect (and
			(transmitted ?y)
		)
	)
)

