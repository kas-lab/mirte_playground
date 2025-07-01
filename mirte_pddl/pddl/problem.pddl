(define (problem mirte_arena)
  (:domain mirte)

  (:objects
    wp0 wp1 wp2 wp3 - waypoint
  )

  (:init
    (robot_at wp0)
  )

  (:goal
    (and
      (robot_at wp0)
    )
  )
)