module WorldsHelper

  def robots(world)
    "Robot".pluralize(world.count_robots_on_world)
  end

  def moves(world)
    "Move".pluralize(world.count_total_moves_on_world)
  end

end
