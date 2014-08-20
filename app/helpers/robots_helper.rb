module RobotsHelper

  def display_status(robot)
    return "DEPLOYED" if robot.status == 1
    return "LOST" if robot.status == 0
  end

end
