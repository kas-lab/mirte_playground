(define (problem mirte_arena)
  (:domain mirte)

  (:objects
    wp0 wp1 wp2 wp3 - waypoint
  )

  (:init
    (robot_at wp0)
    (wp_not_visited wp0)
    (wp_not_visited wp1)
    (wp_not_visited wp2)
    (wp_not_visited wp3)
  )

  (:goal
    (and
        (wp_visited wp0)
        (wp_visited wp1)
        (wp_visited wp2)
        (wp_visited wp3)
        (robot_at wp0)
    )
  )
)