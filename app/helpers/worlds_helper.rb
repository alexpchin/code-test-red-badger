module WorldsHelper

  def robots(world)
    "Robot".pluralize(world.count_robots_on_world)
  end

  def moves(world)
    "Move".pluralize(world.count_total_moves_on_world)
  end

  def display_robots(world)
    if @robots.present?
      content_tag :ul, class: "no-bullet" do
        render @robots
      end
    else 
      content_tag(:p, "No robots have been deployed.")
    end
  end

  def display_moves(world)
    if @moves.present?
      content_tag :ul, class: "no-bullet" do
        render @moves
      end
    else 
      content_tag(:p, "No moves have been made.")
    end
  end

end
