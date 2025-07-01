(define (domain mirte)
  (:requirements
    :strips
    :typing
    :adl
    :negative-preconditions
    :durative-actions
  )

  (:types
    waypoint
  )

  (:predicates
    (robot_at ?wp - waypoint)
  )

  (:durative-action move
    :parameters (?wp1 ?wp2 - waypoint)
    :duration ( = ?duration 5)
    :condition (and
        (at start (robot_at ?wp1))
    )
    :effect (and
    )
  )
)