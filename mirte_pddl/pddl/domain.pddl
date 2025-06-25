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
    (wp_visited ?wp - waypoint)
    (wp_not_visited ?wp - waypoint)
  )

  (:durative-action move
    :parameters (?wp1 ?wp2 - waypoint)
    :duration ( = ?duration 5)
    :condition (and
        (at start (robot_at ?wp1))
        (at start (wp_not_visited ?wp2))
    )
    :effect (and
        (at start (not(robot_at ?wp1)))
        (at end (robot_at ?wp2))
        (at end (wp_visited ?wp2))
        (at end (not (wp_not_visited ?wp2)))
    )
  )
)